Content-Type: multipart/mixed; boundary="===============5849957675367608637=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_linecards_sub1_v1 12/17] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:374:2: warning: Value stored to 'linecards' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 09:17:18 +0800
Message-ID: <202201140955.mvwdqj80-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5849957675367608637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_linecards_sub1_v1
head:   4e49e596068522789b7da37063f60570a59efffc
commit: c3b32e865c9c9056234b9f1582d076a6de19d939 [12/17] mlxsw: core_lineca=
rds: Add line card objects and implement provisioning
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
114/202201140955.mvwdqj80-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/c3b32e865c9c9056234b=
9f1582d076a6de19d939
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards_sub1_v1
        git checkout c3b32e865c9c9056234b9f1582d076a6de19d939
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/params.c:638:12: note: Calling 'kzalloc'
                   mk->mp =3D kzalloc(sizeof(*mk->mp), GFP_KERNEL);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Uninitialized value stored to field 'n=
um'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/params.c:638:12: note: Returning from 'kzalloc'
                   mk->mp =3D kzalloc(sizeof(*mk->mp), GFP_KERNEL);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/params.c:639:7: note: Assuming field 'mp' is non-null
                   if (!mk->mp)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/params.c:639:3: note: '?' condition is false
                   if (!mk->mp)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/params.c:639:12: note: Field 'mp' is non-null
                   if (!mk->mp)
                            ^
   kernel/params.c:639:3: note: '?' condition is false
                   if (!mk->mp)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/params.c:639:3: note: Taking false branch
                   if (!mk->mp)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/params.c:646:7: note: Assuming field 'attrs' is non-null
                   if (!mk->mp->grp.attrs)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/params.c:646:3: note: '?' condition is false
                   if (!mk->mp->grp.attrs)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/params.c:646:20: note: Field 'attrs' is non-null
                   if (!mk->mp->grp.attrs)
                                    ^
   kernel/params.c:646:3: note: '?' condition is false
                   if (!mk->mp->grp.attrs)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/params.c:646:3: note: Taking false branch
                   if (!mk->mp->grp.attrs)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/params.c:653:46: note: The left operand of '+' is a garbage value
                             sizeof(mk->mp->attrs[0]) * (mk->mp->num + 1),
                                                         ~~~~~~~~~~~ ^
   1 warning generated.
   arch/x86/kernel/cpu/mce/core.c:315:4: warning: Value stored to 'apei_err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           apei_err =3D apei_write_mce(final);
                           ^          ~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/core.c:315:4: note: Value stored to 'apei_err' i=
s never read
                           apei_err =3D apei_write_mce(final);
                           ^          ~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:374:2: warning: Val=
ue stored to 'linecards' is never read [clang-analyzer-deadcode.DeadStores]
           linecards =3D linecard->linecards;
           ^           ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:374:2: note: Value =
stored to 'linecards' is never read
           linecards =3D linecard->linecards;
           ^           ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/net/ethernet/intel/e1000/e1000_main.c:3012:22: warning: Derefere=
nce of null pointer [clang-analyzer-core.NullDereference]
           tx_desc->lower.data |=3D cpu_to_le32(adapter->txd_cmd);
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/e1000/e1000_main.c:2972:2: note: 'tx_desc' in=
itialized to a null pointer value
           struct e1000_tx_desc *tx_desc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/e1000/e1000_main.c:2977:6: note: Assuming the=
 condition is true
           if (likely(tx_flags & E1000_TX_FLAGS_TSO)) {
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/ethernet/intel/e1000/e1000_main.c:2977:2: note: '?' conditio=
n is false
           if (likely(tx_flags & E1000_TX_FLAGS_TSO)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2977:2: note: '?' conditio=
n is false
           if (likely(tx_flags & E1000_TX_FLAGS_TSO)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2977:2: note: Taking false=
 branch
           if (likely(tx_flags & E1000_TX_FLAGS_TSO)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2986:6: note: Assuming the=
 condition is true
           if (likely(tx_flags & E1000_TX_FLAGS_CSUM)) {
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/ethernet/intel/e1000/e1000_main.c:2986:2: note: '?' conditio=
n is false
           if (likely(tx_flags & E1000_TX_FLAGS_CSUM)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2986:2: note: '?' conditio=
n is false
           if (likely(tx_flags & E1000_TX_FLAGS_CSUM)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2986:2: note: Taking false=
 branch
           if (likely(tx_flags & E1000_TX_FLAGS_CSUM)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:2991:6: note: Assuming the=
 condition is true
           if (unlikely(tx_flags & E1000_TX_FLAGS_VLAN)) {
               ^

vim +/linecards +374 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

c3b32e865c9c90 Jiri Pirko 2021-12-17  359  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  360  static int mlxsw_linecard_unprov=
ision(struct devlink_linecard *devlink_linecard,
c3b32e865c9c90 Jiri Pirko 2021-12-17  361  				      void *priv,
c3b32e865c9c90 Jiri Pirko 2021-12-17  362  				      struct netlink_ext_ack=
 *extack)
c3b32e865c9c90 Jiri Pirko 2021-12-17  363  {
c3b32e865c9c90 Jiri Pirko 2021-12-17  364  	enum mlxsw_reg_mbct_fsm_state f=
sm_state;
c3b32e865c9c90 Jiri Pirko 2021-12-17  365  	struct mlxsw_linecard *linecard=
 =3D priv;
c3b32e865c9c90 Jiri Pirko 2021-12-17  366  	struct mlxsw_linecards *linecar=
ds;
c3b32e865c9c90 Jiri Pirko 2021-12-17  367  	enum mlxsw_reg_mbct_status stat=
us;
c3b32e865c9c90 Jiri Pirko 2021-12-17  368  	unsigned int ini_wait_retries =
=3D 0;
c3b32e865c9c90 Jiri Pirko 2021-12-17  369  	struct mlxsw_core *mlxsw_core;
c3b32e865c9c90 Jiri Pirko 2021-12-17  370  	int err;
c3b32e865c9c90 Jiri Pirko 2021-12-17  371  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  372  	mutex_lock(&linecard->lock);
c3b32e865c9c90 Jiri Pirko 2021-12-17  373  =

c3b32e865c9c90 Jiri Pirko 2021-12-17 @374  	linecards =3D linecard->linecar=
ds;
c3b32e865c9c90 Jiri Pirko 2021-12-17  375  	mlxsw_core =3D linecard->lineca=
rds->mlxsw_core;
c3b32e865c9c90 Jiri Pirko 2021-12-17  376  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  377  query_ini_status:
c3b32e865c9c90 Jiri Pirko 2021-12-17  378  	err =3D mlxsw_linecard_query_st=
atus(linecard, &status,
c3b32e865c9c90 Jiri Pirko 2021-12-17  379  					  &fsm_state, extack);
c3b32e865c9c90 Jiri Pirko 2021-12-17  380  	if (err)
c3b32e865c9c90 Jiri Pirko 2021-12-17  381  		goto err_out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  382  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  383  	switch (fsm_state) {
c3b32e865c9c90 Jiri Pirko 2021-12-17  384  	case MLXSW_REG_MBCT_FSM_STATE_I=
NI_IN_USE:
c3b32e865c9c90 Jiri Pirko 2021-12-17  385  		if (ini_wait_retries++ > MLXSW=
_LINECARD_INI_WAIT_RETRIES) {
c3b32e865c9c90 Jiri Pirko 2021-12-17  386  			NL_SET_ERR_MSG_MOD(extack, "F=
ailed to wait for linecard INI to be not used");
c3b32e865c9c90 Jiri Pirko 2021-12-17  387  			goto err_out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  388  		}
c3b32e865c9c90 Jiri Pirko 2021-12-17  389  		mdelay(MLXSW_LINECARD_INI_WAIT=
_MS);
c3b32e865c9c90 Jiri Pirko 2021-12-17  390  		goto query_ini_status;
c3b32e865c9c90 Jiri Pirko 2021-12-17  391  	default:
c3b32e865c9c90 Jiri Pirko 2021-12-17  392  		break;
c3b32e865c9c90 Jiri Pirko 2021-12-17  393  	}
c3b32e865c9c90 Jiri Pirko 2021-12-17  394  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  395  	mlxsw_reg_mbct_pack(linecard->m=
bct_pl, linecard->slot_index,
c3b32e865c9c90 Jiri Pirko 2021-12-17  396  			    MLXSW_REG_MBCT_OP_ERASE_I=
NI_IMAGE, 0,
c3b32e865c9c90 Jiri Pirko 2021-12-17  397  			    false, false, NULL);
c3b32e865c9c90 Jiri Pirko 2021-12-17  398  	err =3D mlxsw_reg_write(mlxsw_c=
ore, MLXSW_REG(mbct),
c3b32e865c9c90 Jiri Pirko 2021-12-17  399  			      linecard->mbct_pl);
c3b32e865c9c90 Jiri Pirko 2021-12-17  400  	if (err) {
c3b32e865c9c90 Jiri Pirko 2021-12-17  401  		NL_SET_ERR_MSG_MOD(extack, "Fa=
iled to erase linecard INI");
c3b32e865c9c90 Jiri Pirko 2021-12-17  402  		goto err_out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  403  	}
c3b32e865c9c90 Jiri Pirko 2021-12-17  404  	mlxsw_reg_mbct_unpack(linecard-=
>mbct_pl, NULL, &status, &fsm_state);
c3b32e865c9c90 Jiri Pirko 2021-12-17  405  	switch (status) {
c3b32e865c9c90 Jiri Pirko 2021-12-17  406  	case MLXSW_REG_MBCT_STATUS_ERAS=
E_COMPLETE:
c3b32e865c9c90 Jiri Pirko 2021-12-17  407  		break;
c3b32e865c9c90 Jiri Pirko 2021-12-17  408  	default:
c3b32e865c9c90 Jiri Pirko 2021-12-17  409  		/* Should not happen */
c3b32e865c9c90 Jiri Pirko 2021-12-17  410  		fallthrough;
c3b32e865c9c90 Jiri Pirko 2021-12-17  411  	case MLXSW_REG_MBCT_STATUS_ERAS=
E_FAILED:
c3b32e865c9c90 Jiri Pirko 2021-12-17  412  		NL_SET_ERR_MSG_MOD(extack, "Fa=
iled to erase linecard INI");
c3b32e865c9c90 Jiri Pirko 2021-12-17  413  		goto fix_fsm_err_out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  414  	case MLXSW_REG_MBCT_STATUS_ERRO=
R_INI_IN_USE:
c3b32e865c9c90 Jiri Pirko 2021-12-17  415  		NL_SET_ERR_MSG_MOD(extack, "Fa=
iled to erase linecard INI while being used");
c3b32e865c9c90 Jiri Pirko 2021-12-17  416  		goto fix_fsm_err_out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  417  	}
c3b32e865c9c90 Jiri Pirko 2021-12-17  418  	goto out;
c3b32e865c9c90 Jiri Pirko 2021-12-17  419  =

c3b32e865c9c90 Jiri Pirko 2021-12-17  420  fix_fsm_err_out:
c3b32e865c9c90 Jiri Pirko 2021-12-17  421  	mlxsw_linecard_fix_fsm_state(li=
necard, fsm_state);
c3b32e865c9c90 Jiri Pirko 2021-12-17  422  err_out:
c3b32e865c9c90 Jiri Pirko 2021-12-17  423  	mlxsw_linecard_provision_fail(l=
inecard);
c3b32e865c9c90 Jiri Pirko 2021-12-17  424  out:
c3b32e865c9c90 Jiri Pirko 2021-12-17  425  	mutex_unlock(&linecard->lock);
c3b32e865c9c90 Jiri Pirko 2021-12-17  426  	return err;
c3b32e865c9c90 Jiri Pirko 2021-12-17  427  }
c3b32e865c9c90 Jiri Pirko 2021-12-17  428  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5849957675367608637==--

