Content-Type: multipart/mixed; boundary="===============4264148943462041108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v4 2/2] netfilter: nf_flow_table: count pending offload workqueue tasks
Date: Wed, 06 Jul 2022 14:29:23 +0800
Message-ID: <202207061421.5K9TK70M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4264148943462041108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/netfi=
lter/nf_flow_table_offload.c:977:4: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220615104355.391249-3-vladbu@nvidia.com>
References: <20220615104355.391249-3-vladbu@nvidia.com>
TO: Vlad Buslov <vladbu@nvidia.com>

Hi Vlad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vlad-Buslov/Conntrac=
k-offload-debuggability-improvements/20220615-184515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
2aa4abed37927b9bc5db60dd5d440a7a47435a92
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20220702 (https://download.01.org/0day-ci/arch=
ive/20220706/202207061421.5K9TK70M-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c=
3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/eafef8f9ece19a17faa=
e9a2c1a3343b7eb8caefb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vlad-Buslov/Conntrack-offload-debu=
ggability-improvements/20220615-184515
        git checkout eafef8f9ece19a17faae9a2c1a3343b7eb8caefb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/netdevice.h:3937:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_dec(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:3937:3: note: Control jumps to 'case 4:'  at l=
ine 3937
                   this_cpu_dec(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/netdevice.h:3937:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_dec(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:90:34: note: expanded from macro 'this_cp=
u_add_4'
   #define this_cpu_add_4(pcp, val) arch_this_cpu_add(pcp, val, "laa", "asi=
", int)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_thi=
s_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:254:35: note: expanded from macro 'preempt_disab=
le_notrace'
   #define preempt_disable_notrace() \
                                     ^
   include/linux/netdevice.h:3937:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_dec(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:3937:3: note: Dereference of null pointer
                   this_cpu_dec(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> net/netfilter/nf_flow_table_offload.c:977:4: warning: Dereference of nul=
l pointer [clang-analyzer-core.NullDereference]
                           NF_FLOW_TABLE_STAT_DEC_ATOMIC(net, count_wq_add);
                           ^
   include/net/netfilter/nf_flow_table.h:343:2: note: expanded from macro '=
NF_FLOW_TABLE_STAT_DEC_ATOMIC'
           this_cpu_dec((net)->ft.stat->count)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   net/netfilter/nf_flow_table_offload.c:974:2: note: Control jumps to 'cas=
e FLOW_CLS_REPLACE:'  at line 975
           switch (offload->cmd) {
           ^
   net/netfilter/nf_flow_table_offload.c:977:4: note: Loop condition is fal=
se.  Exiting loop
                           NF_FLOW_TABLE_STAT_DEC_ATOMIC(net, count_wq_add);
                           ^
   include/net/netfilter/nf_flow_table.h:343:2: note: expanded from macro '=
NF_FLOW_TABLE_STAT_DEC_ATOMIC'
           this_cpu_dec((net)->ft.stat->count)
           ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   net/netfilter/nf_flow_table_offload.c:977:4: note: Control jumps to 'cas=
e 4:'  at line 977
                           NF_FLOW_TABLE_STAT_DEC_ATOMIC(net, count_wq_add);
                           ^
   include/net/netfilter/nf_flow_table.h:343:2: note: expanded from macro '=
NF_FLOW_TABLE_STAT_DEC_ATOMIC'
           this_cpu_dec((net)->ft.stat->count)
           ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   net/netfilter/nf_flow_table_offload.c:977:4: note: Loop condition is fal=
se.  Exiting loop
                           NF_FLOW_TABLE_STAT_DEC_ATOMIC(net, count_wq_add);
                           ^
   include/net/netfilter/nf_flow_table.h:343:2: note: expanded from macro '=
NF_FLOW_TABLE_STAT_DEC_ATOMIC'
           this_cpu_dec((net)->ft.stat->count)
           ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:90:34: note: expanded from macro 'this_cp=
u_add_4'
   #define this_cpu_add_4(pcp, val) arch_this_cpu_add(pcp, val, "laa", "asi=
", int)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_thi=
s_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:254:35: note: expanded from macro 'preempt_disab=
le_notrace'
   #define preempt_disable_notrace() \
                                     ^
   net/netfilter/nf_flow_table_offload.c:977:4: note: Loop condition is fal=
se.  Exiting loop
                           NF_FLOW_TABLE_STAT_DEC_ATOMIC(net, count_wq_add);
                           ^
   include/net/netfilter/nf_flow_table.h:343:2: note: expanded from macro '=
NF_FLOW_TABLE_STAT_DEC_ATOMIC'
           this_cpu_dec((net)->ft.stat->count)
           ^
   include/linux/percpu-defs.h:521:28: note: expanded from macro 'this_cpu_=
dec'
   #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \

vim +977 net/netfilter/nf_flow_table_offload.c

c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  966  =

c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  967  static void flow_offload_=
work_handler(struct work_struct *work)
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  968  {
7da182a998d6cf Paul Blakey       2020-03-27  969  	struct flow_offload_work=
 *offload;
eafef8f9ece19a Vlad Buslov       2022-06-15  970  	struct net *net;
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  971  =

7da182a998d6cf Paul Blakey       2020-03-27  972  	offload =3D container_of=
(work, struct flow_offload_work, work);
eafef8f9ece19a Vlad Buslov       2022-06-15  973  	net =3D read_pnet(&offlo=
ad->flowtable->net);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  974  	switch (offload->cmd) {
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  975  		case FLOW_CLS_REPLACE:
f698fe40829b21 Pablo Neira Ayuso 2020-01-06  976  			flow_offload_work_add(=
offload);
eafef8f9ece19a Vlad Buslov       2022-06-15 @977  			NF_FLOW_TABLE_STAT_DEC=
_ATOMIC(net, count_wq_add);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  978  			break;
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  979  		case FLOW_CLS_DESTROY:
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  980  			flow_offload_work_del(=
offload);
eafef8f9ece19a Vlad Buslov       2022-06-15  981  			NF_FLOW_TABLE_STAT_DEC=
_ATOMIC(net, count_wq_del);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  982  			break;
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  983  		case FLOW_CLS_STATS:
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  984  			flow_offload_work_stat=
s(offload);
eafef8f9ece19a Vlad Buslov       2022-06-15  985  			NF_FLOW_TABLE_STAT_DEC=
_ATOMIC(net, count_wq_stats);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  986  			break;
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  987  		default:
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  988  			WARN_ON_ONCE(1);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  989  	}
7da182a998d6cf Paul Blakey       2020-03-27  990  =

2c8897953f3b2f Paul Blakey       2020-05-06  991  	clear_bit(NF_FLOW_HW_PEN=
DING, &offload->flow->flags);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  992  	kfree(offload);
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  993  }
c29f74e0df7a02 Pablo Neira Ayuso 2019-11-12  994  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4264148943462041108==--

