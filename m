Content-Type: multipart/mixed; boundary="===============3943933881103560312=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/elx/efct/efct_hw_queues.c:196:23: warning: Access to field 'hw' results in a dereference of an undefined pointer value [clang-analyzer-core.NullDereference]
Date: Mon, 21 Mar 2022 07:38:43 +0800
Message-ID: <202203210703.7wmi7RSL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3943933881103560312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Daniel Wagner <dwagner@suse.de>
CC: Ram Vegesna <ram.vegesna@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: ebc076b3eddc807729bd81f7bc48e798a3ddc477 scsi: elx: efct: Tie into =
kernel Kconfig and build process
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220321/202203210703.7wmi7RSL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Debc076b3eddc807729bd81f7bc48e798a3ddc477
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ebc076b3eddc807729bd81f7bc48e798a3ddc477
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/common/videobuf2/videobuf2-core.c:1813:3: note: Returning =
without writing to '*vb'
                   return ret;
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:1870:8: note: Returning =
from '__vb2_get_done_vb'
           ret =3D __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1871:6: note: Assuming '=
ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1871:2: note: Taking fal=
se branch
           if (ret < 0)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1874:10: note: Access to=
 field 'state' results in a dereference of a null pointer (loaded from vari=
able 'vb')
           switch (vb->state) {
                   ^~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/usb/typec/class.c:526:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           alt->roles =3D desc->roles;
                      ^
   drivers/usb/typec/class.c:1938:6: note: Assuming 'altmodes_node' is non-=
null
           if (!altmodes_node)
               ^~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1938:2: note: Taking false branch
           if (!altmodes_node)
           ^
   drivers/usb/typec/class.c:1941:2: note: Loop condition is true.  Enterin=
g loop body
           fwnode_for_each_child_node(altmodes_node, child) {
           ^
   include/linux/property.h:100:2: note: expanded from macro 'fwnode_for_ea=
ch_child_node'
           for (child =3D fwnode_get_next_child_node(fwnode, NULL); child; =
  \
           ^
   drivers/usb/typec/class.c:1943:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1943:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1950:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/usb/typec/class.c:1950:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/usb/typec/class.c:1956:7: note: Assuming 'index' is < 'n'
                   if (index >=3D n) {
                       ^~~~~~~~~~
   drivers/usb/typec/class.c:1956:3: note: Taking false branch
                   if (index >=3D n) {
                   ^
   drivers/usb/typec/class.c:1965:9: note: Calling 'typec_port_register_alt=
mode'
                   alt =3D typec_port_register_altmode(port, &desc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:1913:2: note: Taking false branch
           if (IS_ERR(mux))
           ^
   drivers/usb/typec/class.c:1916:9: note: Calling 'typec_register_altmode'
           adev =3D typec_register_altmode(&port->dev, desc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Calling 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:544:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:561:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:519:8: note: Returning from 'kzalloc'
           alt =3D kzalloc(sizeof(*alt), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/class.c:520:6: note: Assuming 'alt' is non-null
           if (!alt)
               ^~~~
   drivers/usb/typec/class.c:520:2: note: Taking false branch
           if (!alt)
           ^
   drivers/usb/typec/class.c:526:13: note: Assigned value is garbage or und=
efined
           alt->roles =3D desc->roles;
                      ^ ~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/scsi/elx/efct/efct_hw_queues.c:196:23: warning: Access to field =
'hw' results in a dereference of an undefined pointer value [clang-analyzer=
-core.NullDereference]
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^
   drivers/scsi/elx/efct/efct_hw_queues.c:32:14: note: Assuming 'i' is >=3D=
 field 'n_eq'
           for (i =3D 0; i < hw->config.n_eq; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:32:2: note: Loop condition is fal=
se. Execution continues on line 73
           for (i =3D 0; i < hw->config.n_eq; i++) {
           ^
   drivers/scsi/elx/efct/efct_hw_queues.c:73:6: note: Calling 'efct_hw_new_=
cq_set'
           if (efct_hw_new_cq_set(eqs, cqs, i, hw->num_qentries[SLI4_QTYPE_=
CQ])) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/elx/efct/efct_hw_queues.c:196:23: note: Access to field 'hw=
' results in a dereference of an undefined pointer value
           struct efct_hw *hw =3D eqs[0]->hw;
                                ^~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/scsi/elx/efct/efct_lio.c:1521:1: warning: Access to field 'gener=
ate_node_acls' results in a dereference of a null pointer (loaded from vari=
able 'a') [clang-analyzer-core.NullDereference]
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1515:10: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           a->name =3D val;                                                =
    \
           ~       ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Left side of '&&' is false
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Loop condition is false. =
 Exiting loop
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:29: note: expanded from macro 'DEF=
_EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
                                      ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'tpg' initialized to a nu=
ll pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1498:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg *tpg =3D container_of(se_tpg,               =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: 'a' initialized to a null=
 pointer value
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1500:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           struct efct_lio_tpg_attrib *a =3D &tpg->tpg_attrib;             =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Assuming 'ret' is >=3D 0
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1505:6: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           if (ret < 0) {                                                  =
  \
               ^~~~~~~
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Taking false branch
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);
   ^
   drivers/scsi/elx/efct/efct_lio.c:1505:2: note: expanded from macro 'DEF_=
EFCT_TPG_ATTRIB'
           if (ret < 0) {                                                  =
  \
           ^
   drivers/scsi/elx/efct/efct_lio.c:1521:1: note: Assuming 'val' is equal t=
o 0
   DEF_EFCT_TPG_ATTRIB(generate_node_acls);

vim +/hw +196 drivers/scsi/elx/efct/efct_hw_queues.c

e10fc23359805b James Smart 2021-06-01  190  =

e10fc23359805b James Smart 2021-06-01  191  u32
e10fc23359805b James Smart 2021-06-01  192  efct_hw_new_cq_set(struct hw_eq=
 *eqs[], struct hw_cq *cqs[],
e10fc23359805b James Smart 2021-06-01  193  		   u32 num_cqs, u32 entry_cou=
nt)
e10fc23359805b James Smart 2021-06-01  194  {
e10fc23359805b James Smart 2021-06-01  195  	u32 i;
e10fc23359805b James Smart 2021-06-01 @196  	struct efct_hw *hw =3D eqs[0]-=
>hw;
e10fc23359805b James Smart 2021-06-01  197  	struct sli4 *sli4 =3D &hw->sli;
e10fc23359805b James Smart 2021-06-01  198  	struct hw_cq *cq =3D NULL;
e10fc23359805b James Smart 2021-06-01  199  	struct sli4_queue *qs[SLI4_MAX=
_CQ_SET_COUNT];
e10fc23359805b James Smart 2021-06-01  200  	struct sli4_queue *assefct[SLI=
4_MAX_CQ_SET_COUNT];
e10fc23359805b James Smart 2021-06-01  201  =

e10fc23359805b James Smart 2021-06-01  202  	/* Initialise CQS pointers to =
NULL */
e10fc23359805b James Smart 2021-06-01  203  	for (i =3D 0; i < num_cqs; i++)
e10fc23359805b James Smart 2021-06-01  204  		cqs[i] =3D NULL;
e10fc23359805b James Smart 2021-06-01  205  =

e10fc23359805b James Smart 2021-06-01  206  	for (i =3D 0; i < num_cqs; i++=
) {
e10fc23359805b James Smart 2021-06-01  207  		cq =3D kzalloc(sizeof(*cq), G=
FP_KERNEL);
e10fc23359805b James Smart 2021-06-01  208  		if (!cq)
e10fc23359805b James Smart 2021-06-01  209  			goto error;
e10fc23359805b James Smart 2021-06-01  210  =

e10fc23359805b James Smart 2021-06-01  211  		cqs[i]          =3D cq;
e10fc23359805b James Smart 2021-06-01  212  		cq->eq          =3D eqs[i];
e10fc23359805b James Smart 2021-06-01  213  		cq->type        =3D SLI4_QTYP=
E_CQ;
e10fc23359805b James Smart 2021-06-01  214  		cq->instance    =3D hw->cq_co=
unt++;
e10fc23359805b James Smart 2021-06-01  215  		cq->entry_count =3D entry_cou=
nt;
e10fc23359805b James Smart 2021-06-01  216  		cq->queue       =3D &hw->cq[c=
q->instance];
e10fc23359805b James Smart 2021-06-01  217  		qs[i]           =3D cq->queue;
e10fc23359805b James Smart 2021-06-01  218  		assefct[i]       =3D eqs[i]->=
queue;
e10fc23359805b James Smart 2021-06-01  219  		INIT_LIST_HEAD(&cq->q_list);
e10fc23359805b James Smart 2021-06-01  220  	}
e10fc23359805b James Smart 2021-06-01  221  =

e10fc23359805b James Smart 2021-06-01  222  	if (sli_cq_alloc_set(sli4, qs,=
 num_cqs, entry_count, assefct)) {
e10fc23359805b James Smart 2021-06-01  223  		efc_log_err(hw->os, "Failed t=
o create CQ Set.\n");
e10fc23359805b James Smart 2021-06-01  224  		goto error;
e10fc23359805b James Smart 2021-06-01  225  	}
e10fc23359805b James Smart 2021-06-01  226  =

e10fc23359805b James Smart 2021-06-01  227  	for (i =3D 0; i < num_cqs; i++=
) {
e10fc23359805b James Smart 2021-06-01  228  		hw->hw_cq[cqs[i]->instance] =
=3D cqs[i];
e10fc23359805b James Smart 2021-06-01  229  		INIT_LIST_HEAD(&cqs[i]->list_=
entry);
e10fc23359805b James Smart 2021-06-01  230  		list_add_tail(&cqs[i]->list_e=
ntry, &cqs[i]->eq->cq_list);
e10fc23359805b James Smart 2021-06-01  231  	}
e10fc23359805b James Smart 2021-06-01  232  =

e10fc23359805b James Smart 2021-06-01  233  	return 0;
e10fc23359805b James Smart 2021-06-01  234  =

e10fc23359805b James Smart 2021-06-01  235  error:
e10fc23359805b James Smart 2021-06-01  236  	for (i =3D 0; i < num_cqs; i++=
) {
e10fc23359805b James Smart 2021-06-01  237  		kfree(cqs[i]);
e10fc23359805b James Smart 2021-06-01  238  		cqs[i] =3D NULL;
e10fc23359805b James Smart 2021-06-01  239  	}
e10fc23359805b James Smart 2021-06-01  240  	return -EIO;
e10fc23359805b James Smart 2021-06-01  241  }
e10fc23359805b James Smart 2021-06-01  242  =


:::::: The code@line 196 was first introduced by commit
:::::: e10fc23359805bf688e005446e054d541b24728e scsi: elx: efct: Hardware q=
ueue creation and deletion

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3943933881103560312==--

