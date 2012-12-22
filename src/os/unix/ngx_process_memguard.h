
#ifndef _NGX_PROCESS_MEMGUARD_H_INCLUDED_
#define _NGX_PROCESS_MEMGUARD_H_INCLUDED_

#include <ngx_atomic.h>

char ngx_master_process_memguard_triggered(long min_mem);

#endif /* _NGX_PROCESS_MEMGUARD_H_INCLUDED_ */