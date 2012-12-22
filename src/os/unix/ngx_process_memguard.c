
#include <stdio.h>
#include <string.h>
#include <ngx_process_memguard.h>

const unsigned MAXLINE=9999;

char* _ngx_process_memguard_trim_ws(char *line)
{
    return line + strspn(line, " \t");
}

char* _ngx_process_memguard_find_line(char *line)
{
	const char* match = "MemFree:";
	const int match_len = 8;
    char *p;

    p = _ngx_process_memguard_trim_ws(line);
	
    return (strncmp(p, match,  match_len) == 0) ? (p + match_len) : NULL;
}

uint16_t ngx_master_process_memguard_triggered(uint64_t min_mem)
{
    char *p, *pend;
    char line[MAXLINE];
    uint64_t fmem = 0;
    FILE *proc_meminfo = fopen("/proc/meminfo", "r");

    if (!proc_meminfo) {
        return 0;
	}
	
	while (p = fgets(line, MAXLINE, proc_meminfo)) {        
		if (p = _ngx_process_memguard_find_line(line)) {
			
			 // check last char for newline terminator
            pend = p + strlen(p) - 1;
            if (*pend == '\n') *pend=0;
            
			p = _ngx_process_memguard_trim_ws(p);			
			sscanf(p, "%ld", &fmem);
	
			fclose(proc_meminfo);
			
			return (fmem * 1024) < min_mem;
        }
    }
	
	fclose(proc_meminfo);	
	return 0;	
}