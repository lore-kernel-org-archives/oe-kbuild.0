Content-Type: multipart/mixed; boundary="===============1137540976304084265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tee/optee/smc_abi.c:52:21: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 21:30:31 +0800
Message-ID: <202209042101.QcdRvtFI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1137540976304084265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/t=
ee/optee/smc_abi.c:52:21: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7726d4c3e60bfe206738894267414a5f10510f1a
commit: c51a564a5b48355f30309b84cdffe3f96d1ae0d3 optee: isolate smc abi
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220831 (https://download.01.org/0day-ci/archi=
ve/20220904/202209042101.QcdRvtFI-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc51a564a5b48355f30309b84cdffe3f96d1ae0d3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c51a564a5b48355f30309b84cdffe3f96d1ae0d3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/trace/define_trace.h:103,
                    from drivers/tee/optee/optee_trace.h:67,
                    from drivers/tee/optee/smc_abi.c:26:
   drivers/tee/optee/./optee_trace.h: In function 'perf_trace_optee_invoke_=
fn_begin':
   include/trace/perf.h:38:25: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      38 |         struct pt_regs *__regs;                                 =
        \
         |                         ^~~~~~
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
      75 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:19:1: note: in expansion of macro 'TRA=
CE_EVENT'
      19 | TRACE_EVENT(optee_invoke_fn_begin,
         | ^~~~~~~~~~~
     'perf_trace_optee_invoke_fn_begin': event 1
       |
       |include/trace/perf.h:38:25:
       |   38 |         struct pt_regs *__regs;                            =
             \
       |      |                         ^~~~~~
       |      |                         |
       |      |                         (1) use of uninitialized value '<un=
known>' here
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
       |   75 |         DECLARE_EVENT_CLASS(name,                          =
    \
       |      |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:19:1: note: in expansion of macro 'TRA=
CE_EVENT'
       |   19 | TRACE_EVENT(optee_invoke_fn_begin,
       |      | ^~~~~~~~~~~
       |
   include/trace/perf.h:44:13: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 |         int rctx;                                               =
        \
         |             ^~~~
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
      75 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:19:1: note: in expansion of macro 'TRA=
CE_EVENT'
      19 | TRACE_EVENT(optee_invoke_fn_begin,
         | ^~~~~~~~~~~
     'perf_trace_optee_invoke_fn_begin': event 1
       |
       |include/trace/perf.h:44:13:
       |   44 |         int rctx;                                          =
             \
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
       |   75 |         DECLARE_EVENT_CLASS(name,                          =
    \
       |      |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:19:1: note: in expansion of macro 'TRA=
CE_EVENT'
       |   19 | TRACE_EVENT(optee_invoke_fn_begin,
       |      | ^~~~~~~~~~~
       |
   drivers/tee/optee/./optee_trace.h: In function 'perf_trace_optee_invoke_=
fn_end':
   include/trace/perf.h:38:25: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      38 |         struct pt_regs *__regs;                                 =
        \
         |                         ^~~~~~
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
      75 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:40:1: note: in expansion of macro 'TRA=
CE_EVENT'
      40 | TRACE_EVENT(optee_invoke_fn_end,
         | ^~~~~~~~~~~
     'perf_trace_optee_invoke_fn_end': event 1
       |
       |include/trace/perf.h:38:25:
       |   38 |         struct pt_regs *__regs;                            =
             \
       |      |                         ^~~~~~
       |      |                         |
       |      |                         (1) use of uninitialized value '<un=
known>' here
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
       |   75 |         DECLARE_EVENT_CLASS(name,                          =
    \
       |      |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:40:1: note: in expansion of macro 'TRA=
CE_EVENT'
       |   40 | TRACE_EVENT(optee_invoke_fn_end,
       |      | ^~~~~~~~~~~
       |
   include/trace/perf.h:44:13: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 |         int rctx;                                               =
        \
         |             ^~~~
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
      75 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:40:1: note: in expansion of macro 'TRA=
CE_EVENT'
      40 | TRACE_EVENT(optee_invoke_fn_end,
         | ^~~~~~~~~~~
     'perf_trace_optee_invoke_fn_end': event 1
       |
       |include/trace/perf.h:44:13:
       |   44 |         int rctx;                                          =
             \
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   include/trace/trace_events.h:75:9: note: in expansion of macro 'DECLARE_=
EVENT_CLASS'
       |   75 |         DECLARE_EVENT_CLASS(name,                          =
    \
       |      |         ^~~~~~~~~~~~~~~~~~~
   drivers/tee/optee/./optee_trace.h:40:1: note: in expansion of macro 'TRA=
CE_EVENT'
       |   40 | TRACE_EVENT(optee_invoke_fn_end,
       |      | ^~~~~~~~~~~
       |
   drivers/tee/optee/smc_abi.c: In function 'from_msg_param_tmp_mem':
>> drivers/tee/optee/smc_abi.c:52:21: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      52 |         phys_addr_t pa;
         |                     ^~
     'from_msg_param_tmp_mem': event 1
       |
       |   52 |         phys_addr_t pa;
       |      |                     ^~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'to_msg_param_tmp_mem':
   drivers/tee/optee/smc_abi.c:159:21: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     159 |         phys_addr_t pa;
         |                     ^~
     'to_msg_param_tmp_mem': event 1
       |
       |  159 |         phys_addr_t pa;
       |      |                     ^~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'optee_shm_register':
   drivers/tee/optee/smc_abi.c:433:31: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     433 |         struct optee_msg_arg *msg_arg;
         |                               ^~~~~~~
     'optee_shm_register': event 1
       |
       |  433 |         struct optee_msg_arg *msg_arg;
       |      |                               ^~~~~~~
       |      |                               |
       |      |                               (1) use of uninitialized valu=
e '<unknown>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'optee_shm_unregister':
   drivers/tee/optee/smc_abi.c:483:31: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     483 |         struct optee_msg_arg *msg_arg;
         |                               ^~~~~~~
     'optee_shm_unregister': event 1
       |
       |  483 |         struct optee_msg_arg *msg_arg;
       |      |                               ^~~~~~~
       |      |                               |
       |      |                               (1) use of uninitialized valu=
e '<unknown>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'handle_rpc_func_cmd_shm_alloc':
   drivers/tee/optee/smc_abi.c:622:21: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     622 |         phys_addr_t pa;
         |                     ^~
     'handle_rpc_func_cmd_shm_alloc': event 1
       |
       |  622 |         phys_addr_t pa;
       |      |                     ^~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'optee_handle_rpc':
   drivers/tee/optee/smc_abi.c:769:21: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     769 |         phys_addr_t pa;
         |                     ^~
     'optee_handle_rpc': event 1
       |
       |  769 |         phys_addr_t pa;
       |      |                     ^~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'optee_smc_do_call_with_arg':
   drivers/tee/optee/smc_abi.c:828:21: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     828 |         phys_addr_t parg;
         |                     ^~~~
     'optee_smc_do_call_with_arg': event 1
       |
       |  828 |         phys_addr_t parg;
       |      |                     ^~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'get_invoke_func':
   drivers/tee/optee/smc_abi.c:1153:21: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1153 |         const char *method;
         |                     ^~~~~~
     'get_invoke_func': event 1
       |
       | 1153 |         const char *method;
       |      |                     ^~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/tee/optee/smc_abi.c: In function 'optee_probe':
   drivers/tee/optee/smc_abi.c:1217:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1217 |         u32 sec_caps;
         |             ^~~~~~~~
     'optee_probe': event 1
       |
       | 1217 |         u32 sec_caps;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +52 drivers/tee/optee/smc_abi.c

c51a564a5b4835 Jens Wiklander 2021-07-21  40  =

c51a564a5b4835 Jens Wiklander 2021-07-21  41  /*
c51a564a5b4835 Jens Wiklander 2021-07-21  42   * 1. Convert between struct =
tee_param and struct optee_msg_param
c51a564a5b4835 Jens Wiklander 2021-07-21  43   *
c51a564a5b4835 Jens Wiklander 2021-07-21  44   * optee_from_msg_param() and=
 optee_to_msg_param() are the main
c51a564a5b4835 Jens Wiklander 2021-07-21  45   * functions.
c51a564a5b4835 Jens Wiklander 2021-07-21  46   */
c51a564a5b4835 Jens Wiklander 2021-07-21  47  =

c51a564a5b4835 Jens Wiklander 2021-07-21  48  static int from_msg_param_tmp=
_mem(struct tee_param *p, u32 attr,
c51a564a5b4835 Jens Wiklander 2021-07-21  49  				  const struct optee_msg_=
param *mp)
c51a564a5b4835 Jens Wiklander 2021-07-21  50  {
c51a564a5b4835 Jens Wiklander 2021-07-21  51  	struct tee_shm *shm;
c51a564a5b4835 Jens Wiklander 2021-07-21 @52  	phys_addr_t pa;
c51a564a5b4835 Jens Wiklander 2021-07-21  53  	int rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  54  =

c51a564a5b4835 Jens Wiklander 2021-07-21  55  	p->attr =3D TEE_IOCTL_PARAM_=
ATTR_TYPE_MEMREF_INPUT +
c51a564a5b4835 Jens Wiklander 2021-07-21  56  		  attr - OPTEE_MSG_ATTR_TYP=
E_TMEM_INPUT;
c51a564a5b4835 Jens Wiklander 2021-07-21  57  	p->u.memref.size =3D mp->u.t=
mem.size;
c51a564a5b4835 Jens Wiklander 2021-07-21  58  	shm =3D (struct tee_shm *)(u=
nsigned long)mp->u.tmem.shm_ref;
c51a564a5b4835 Jens Wiklander 2021-07-21  59  	if (!shm) {
c51a564a5b4835 Jens Wiklander 2021-07-21  60  		p->u.memref.shm_offs =3D 0;
c51a564a5b4835 Jens Wiklander 2021-07-21  61  		p->u.memref.shm =3D NULL;
c51a564a5b4835 Jens Wiklander 2021-07-21  62  		return 0;
c51a564a5b4835 Jens Wiklander 2021-07-21  63  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  64  =

c51a564a5b4835 Jens Wiklander 2021-07-21  65  	rc =3D tee_shm_get_pa(shm, 0=
, &pa);
c51a564a5b4835 Jens Wiklander 2021-07-21  66  	if (rc)
c51a564a5b4835 Jens Wiklander 2021-07-21  67  		return rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  68  =

c51a564a5b4835 Jens Wiklander 2021-07-21  69  	p->u.memref.shm_offs =3D mp-=
>u.tmem.buf_ptr - pa;
c51a564a5b4835 Jens Wiklander 2021-07-21  70  	p->u.memref.shm =3D shm;
c51a564a5b4835 Jens Wiklander 2021-07-21  71  =

c51a564a5b4835 Jens Wiklander 2021-07-21  72  	/* Check that the memref is =
covered by the shm object */
c51a564a5b4835 Jens Wiklander 2021-07-21  73  	if (p->u.memref.size) {
c51a564a5b4835 Jens Wiklander 2021-07-21  74  		size_t o =3D p->u.memref.sh=
m_offs +
c51a564a5b4835 Jens Wiklander 2021-07-21  75  			   p->u.memref.size - 1;
c51a564a5b4835 Jens Wiklander 2021-07-21  76  =

c51a564a5b4835 Jens Wiklander 2021-07-21  77  		rc =3D tee_shm_get_pa(shm, =
o, NULL);
c51a564a5b4835 Jens Wiklander 2021-07-21  78  		if (rc)
c51a564a5b4835 Jens Wiklander 2021-07-21  79  			return rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  80  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  81  =

c51a564a5b4835 Jens Wiklander 2021-07-21  82  	return 0;
c51a564a5b4835 Jens Wiklander 2021-07-21  83  }
c51a564a5b4835 Jens Wiklander 2021-07-21  84  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1137540976304084265==--

