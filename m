Content-Type: multipart/mixed; boundary="===============5321414889761694882=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/qdsp6/audioreach.c:500:36: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Mon, 18 Apr 2022 16:51:16 +0800
Message-ID: <202204181618.SMd6OlsI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5321414889761694882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: cf989b68fcadbeeea1446e50fd8b2f24a0f1275c ASoC: qdsp6: audioreach: a=
dd Kconfig and Makefile
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220418/202204181618.SMd6OlsI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf989b68fcadbeeea1446e50fd8b2f24a0f1275c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf989b68fcadbeeea1446e50fd8b2f24a0f1275c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:796:2: note: Taking false branch
           if (compound_mask =3D=3D NULL)
           ^
   drivers/iio/industrialio-buffer.c:801:2: note: Left side of '&&' is false
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/iio/industrialio-buffer.c:801:2: note: Taking false branch
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/industrialio-buffer.c:801:2: note: Loop condition is false. =
 Exiting loop
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/iio/industrialio-buffer.c:801:22: note: Value assigned to 'buffe=
r'
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
                               ^
   include/linux/list.h:628:7: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:801:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/iio/industrialio-buffer.c:802:7: note: Assuming 'buffer' is equa=
l to 'remove_buffer'
                   if (buffer =3D=3D remove_buffer)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-buffer.c:802:3: note: Taking true branch
                   if (buffer =3D=3D remove_buffer)
                   ^
   drivers/iio/industrialio-buffer.c:803:4: note:  Execution continues on l=
ine 801
                           continue;
                           ^
   drivers/iio/industrialio-buffer.c:801:2: note: Dereference of null point=
er
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   2 warnings generated.
>> sound/soc/qcom/qdsp6/audioreach.c:500:36: warning: Division by zero [cla=
ng-analyzer-core.DivideZero]
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:480:2: note: 'num_containers' initiali=
zed to 0
           int num_containers =3D 0;
           ^~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Left side of '&&' is false
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Taking false branch
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
 Exiting loop
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
Execution continues on line 499
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:500:36: note: Division by zero
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
>> sound/soc/qcom/qdsp6/audioreach.c:558:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p +=3D mc_sz;
           ^    ~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:558:2: note: Value stored to 'p' is ne=
ver read
           p +=3D mc_sz;
           ^    ~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/sched/sch_fq_codel.c:196:11: warning: The left operand of '&' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (ret & __NET_XMIT_BYPASS)
                       ~~~ ^
   net/sched/sch_fq_codel.c:190:2: note: 'ret' declared without an initial =
value
           int ret;
           ^~~~~~~
   net/sched/sch_fq_codel.c:194:8: note: Calling 'fq_codel_classify'
           idx =3D fq_codel_classify(skb, sch, &ret);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_fq_codel.c:84:6: note: Assuming the condition is false
           if (TC_H_MAJ(skb->priority) =3D=3D sch->handle &&
               ^
   include/uapi/linux/pkt_sched.h:70:21: note: expanded from macro 'TC_H_MA=
J'
   #define TC_H_MAJ(h) ((h)&TC_H_MAJ_MASK)
                       ^
   net/sched/sch_fq_codel.c:84:45: note: Left side of '&&' is false
           if (TC_H_MAJ(skb->priority) =3D=3D sch->handle &&
                                                      ^
   net/sched/sch_fq_codel.c:89:11: note: Left side of '||' is false
           filter =3D rcu_dereference_bh(q->filter_list);
                    ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/sch_fq_codel.c:89:11: note: Left side of '||' is false
           filter =3D rcu_dereference_bh(q->filter_list);
                    ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sched/sch_fq_codel.c:89:11: note: Left side of '||' is true
           filter =3D rcu_dereference_bh(q->filter_list);
                    ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   net/sched/sch_fq_codel.c:89:11: note: Taking false branch
           filter =3D rcu_dereference_bh(q->filter_list);
                    ^
   include/linux/rcupdate.h:604:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:543:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_bh_held(), __r=
cu)

vim +500 sound/soc/qcom/qdsp6/audioreach.c

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  464  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  465  void *audioreach_alloc=
_graph_pkt(struct q6apm *apm, struct list_head *sg_list, int graph_id)
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  466  {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  467  	int payload_size, sg_=
sz, cont_sz, ml_sz, mp_sz, mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  468  	struct apm_module_par=
am_data  *param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  469  	struct apm_container_=
params *cont_params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  470  	struct audioreach_con=
tainer *container;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  471  	struct apm_sub_graph_=
params *sg_params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  472  	struct apm_mod_conn_l=
ist_params *mcon;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  473  	struct apm_graph_open=
_params params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  474  	struct apm_prop_list_=
params *mprop;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  475  	struct audioreach_mod=
ule *module;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  476  	struct audioreach_sub=
_graph *sgs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  477  	struct apm_mod_list_o=
bj *mlobj;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  478  	int num_modules_per_l=
ist;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  479  	int num_connections =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  480  	int num_containers =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  481  	int num_sub_graphs =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  482  	int num_modules =3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  483  	int num_modules_list;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  484  	struct gpr_pkt *pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  485  	void *p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  486  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @487  	list_for_each_entry(s=
gs, sg_list, node) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  488  		num_sub_graphs++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  489  		list_for_each_entry(=
container, &sgs->container_list, node) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  490  			num_containers++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  491  			num_modules +=3D co=
ntainer->num_modules;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  492  			list_for_each_conta=
iner_module(module, container) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  493  				if (module->src_mo=
d_inst_id)
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  494  					num_connections++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  495  			}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  496  		}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  497  	}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  498  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  499  	num_modules_list =3D =
num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @500  	num_modules_per_list =
=3D num_modules/num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  501  	sg_sz =3D APM_SUB_GRA=
PH_PSIZE(sg_params, num_sub_graphs);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  502  	cont_sz =3D APM_CONTA=
INER_PSIZE(cont_params, num_containers);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  503  	ml_sz =3D	ALIGN(sizeo=
f(struct apm_module_list_params) +
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  504  		num_modules_list * A=
PM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  505  	mp_sz =3D APM_MOD_PRO=
P_PSIZE(mprop, num_modules);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  506  	mc_sz =3D	APM_MOD_CON=
N_PSIZE(mcon, num_connections);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  507  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  508  	payload_size =3D sg_s=
z + cont_sz + ml_sz + mp_sz + mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  509  	pkt =3D audioreach_al=
loc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  510  	if (IS_ERR(pkt))
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  511  		return pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  512  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  513  	p =3D (void *)pkt + G=
PR_HDR_SIZE + APM_CMD_HDR_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  514  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  515  	/* SubGraph */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  516  	params.sg_data =3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  517  	param_data =3D &param=
s.sg_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  518  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  519  	param_data->param_id =
=3D APM_PARAM_ID_SUB_GRAPH_CONFIG;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  520  	param_data->param_siz=
e =3D sg_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  521  	params.sg_data->num_s=
ub_graphs =3D num_sub_graphs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  522  	p +=3D sg_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  523  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  524  	/* Container */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  525  	params.cont_data =3D =
p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  526  	param_data =3D &param=
s.cont_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  527  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  528  	param_data->param_id =
=3D APM_PARAM_ID_CONTAINER_CONFIG;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  529  	param_data->param_siz=
e =3D cont_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  530  	params.cont_data->num=
_containers =3D num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  531  	p +=3D cont_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  532  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  533  	/* Module List*/
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  534  	params.mod_list_data =
=3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  535  	param_data =3D &param=
s.mod_list_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  536  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  537  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_LIST;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  538  	param_data->param_siz=
e =3D ml_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  539  	params.mod_list_data-=
>num_modules_list =3D num_sub_graphs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  540  	p +=3D ml_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  541  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  542  	/* Module Properties =
*/
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  543  	params.mod_prop_data =
=3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  544  	param_data =3D &param=
s.mod_prop_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  545  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  546  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_PROP;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  547  	param_data->param_siz=
e =3D mp_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  548  	params.mod_prop_data-=
>num_modules_prop_cfg =3D num_modules;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  549  	p +=3D mp_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  550  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  551  	/* Module Connections=
 */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  552  	params.mod_conn_list_=
data =3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  553  	param_data =3D &param=
s.mod_conn_list_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  554  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  555  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_CONN;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  556  	param_data->param_siz=
e =3D mc_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  557  	params.mod_conn_list_=
data->num_connections =3D num_connections;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @558  	p +=3D mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  559  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  560  	audioreach_populate_g=
raph(&params, sg_list, num_sub_graphs);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  561  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  562  	return pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  563  }
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  564  EXPORT_SYMBOL_GPL(audi=
oreach_alloc_graph_pkt);
25ab80db6b133c2 Srinivas Kandagatla 2021-10-26  565  =


:::::: The code at line 500 was first introduced by commit
:::::: 5477518b8a0e8a45239646acd80c9bafc4401522 ASoC: qdsp6: audioreach: ad=
d q6apm support

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5321414889761694882==--

