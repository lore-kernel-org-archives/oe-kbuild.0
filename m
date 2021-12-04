Content-Type: multipart/mixed; boundary="===============3498423647227056480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 4/4] r8169: add sysfs for dash
Date: Sun, 05 Dec 2021 03:54:45 +0800
Message-ID: <202112050307.xxJGRfym-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3498423647227056480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129101315.16372-385-nic_swsd@realtek.com>
References: <20211129101315.16372-385-nic_swsd@realtek.com>
TO: Hayes Wang <hayeswang@realtek.com>

Hi Hayes,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on horms-ipvs/master]
[also build test WARNING on linus/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hayes-Wang/r8169-support-d=
ash/20211129-181721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git mast=
er
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211205/202112050307.xxJGRfym-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e0b1115782b23f3f7cc28430c=
69ed35655dbf7eb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hayes-Wang/r8169-support-dash/2021=
1129-181721
        git checkout e0b1115782b23f3f7cc28430c69ed35655dbf7eb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:67:2: note: expanded from macro '__smp_st=
ore_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/target/target_core_alua.c:1809:2: note: Loop condition is false.=
  Exiting loop
           rcu_assign_pointer(lun->lun_tg_pt_gp, tg_pt_gp);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_sto=
re_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:67:2: note: expanded from macro '__smp_st=
ore_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/target/target_core_alua.c:1809:2: note: Loop condition is false.=
  Exiting loop
           rcu_assign_pointer(lun->lun_tg_pt_gp, tg_pt_gp);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_sto=
re_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:67:2: note: expanded from macro '__smp_st=
ore_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:53:35: note: expanded from macro '__WRITE_O=
NCE'
   #define __WRITE_ONCE(x, val)                                            \
                                                                           ^
   drivers/target/target_core_alua.c:1809:2: note: Loop condition is false.=
  Exiting loop
           rcu_assign_pointer(lun->lun_tg_pt_gp, tg_pt_gp);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_sto=
re_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:67:2: note: expanded from macro '__smp_st=
ore_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   drivers/target/target_core_alua.c:1809:2: note: Loop condition is false.=
  Exiting loop
           rcu_assign_pointer(lun->lun_tg_pt_gp, tg_pt_gp);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_sto=
re_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/x86/include/asm/barrier.h:63:39: note: expanded from macro '__smp_s=
tore_release'
   #define __smp_store_release(p, v)                                       \
                                                                           ^
   drivers/target/target_core_alua.c:1809:2: note: Loop condition is false.=
  Exiting loop
           rcu_assign_pointer(lun->lun_tg_pt_gp, tg_pt_gp);
           ^
   include/linux/rcupdate.h:445:44: note: expanded from macro 'rcu_assign_p=
ointer'
   #define rcu_assign_pointer(p, v)                                        =
      \
                                                                           =
      ^
   drivers/target/target_core_alua.c:1810:41: note: Passing null pointer va=
lue via 2nd parameter 'head'
           list_add_tail(&lun->lun_tg_pt_gp_link, &tg_pt_gp->tg_pt_gp_lun_l=
ist);
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_alua.c:1810:2: note: Calling 'list_add_tail'
           list_add_tail(&lun->lun_tg_pt_gp_link, &tg_pt_gp->tg_pt_gp_lun_l=
ist);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/list.h:102:18: note: Access to field 'prev' results in a d=
ereference of a null pointer (loaded from variable 'head')
           __list_add(new, head->prev, head);
                           ^~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/net/ethernet/realtek/r8169_main.c:4677:3: warning: Call to funct=
ion 'strcat' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                   strcat(buf, "enable\n");
                   ^~~~~~
   drivers/net/ethernet/realtek/r8169_main.c:4677:3: note: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119
                   strcat(buf, "enable\n");
                   ^~~~~~
   drivers/net/ethernet/realtek/r8169_main.c:4679:3: warning: Call to funct=
ion 'strcat' is insecure as it does not provide bounding of the memory buff=
er. Replace unbounded copy functions with analogous functions that support =
length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecu=
reAPI.strcpy]
                   strcat(buf, "disable\n");
                   ^~~~~~
   drivers/net/ethernet/realtek/r8169_main.c:4679:3: note: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119
                   strcat(buf, "disable\n");
                   ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/net/ethernet/realtek/r8169_dash.c:882:3: warning: Value stored t=
o 'dest' is never read [clang-analyzer-deadcode.DeadStores]
                   dest +=3D size;
                   ^       ~~~~
   drivers/net/ethernet/realtek/r8169_dash.c:882:3: note: Value stored to '=
dest' is never read
                   dest +=3D size;
                   ^       ~~~~
   Suppressed 13 warnings (11 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/ethernet/sis/sis900.c:532:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/net/ethernet/sis/sis900.c:532:2: note: Value stored to 'ret' is =
never read
           ret =3D 0;
           ^     ~
   drivers/net/ethernet/sis/sis900.c:740:3: warning: Value stored to 'statu=
s' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D mdio_read(net_dev, phy->phy_addr, MII_STATUS);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:740:3: note: Value stored to 'status' =
is never read
                   status =3D mdio_read(net_dev, phy->phy_addr, MII_STATUS);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:767:23: warning: Access to field 'phy_=
addr' results in a dereference of a null pointer (loaded from variable 'def=
ault_phy') [clang-analyzer-core.NullDereference]
                   sis_priv->cur_phy =3D default_phy->phy_addr;
                                       ^
   drivers/net/ethernet/sis/sis900.c:1325:11: note: Value assigned to field=
 'first_mii'
           status =3D mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:1328:6: note: Assuming the condition i=
s true
           if (!netif_carrier_ok(net_dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:1328:2: note: Taking true branch
           if (!netif_carrier_ok(net_dev)) {
           ^
   drivers/net/ethernet/sis/sis900.c:1331:12: note: Calling 'sis900_default=
_phy'
                   status =3D sis900_default_phy(net_dev);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:739:39: note: Assuming pointer value i=
s null
           for (phy=3Dsis_priv->first_mii; phy; phy=3Dphy->next) {
                                         ^~~
   drivers/net/ethernet/sis/sis900.c:739:9: note: Loop condition is false. =
Execution continues on line 758
           for (phy=3Dsis_priv->first_mii; phy; phy=3Dphy->next) {
           ^
   drivers/net/ethernet/sis/sis900.c:758:7: note: 'default_phy' is null
           if (!default_phy && phy_home)
                ^~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:758:6: note: Left side of '&&' is true
           if (!default_phy && phy_home)
               ^
   drivers/net/ethernet/sis/sis900.c:758:22: note: 'phy_home' is null
           if (!default_phy && phy_home)
                               ^~~~~~~~
   drivers/net/ethernet/sis/sis900.c:758:2: note: Taking false branch
           if (!default_phy && phy_home)
           ^
   drivers/net/ethernet/sis/sis900.c:760:12: note: 'default_phy' is null
           else if (!default_phy && phy_lan)
                     ^~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:760:11: note: Left side of '&&' is true
           else if (!default_phy && phy_lan)
                    ^
   drivers/net/ethernet/sis/sis900.c:760:27: note: 'phy_lan' is null
           else if (!default_phy && phy_lan)
                                    ^~~~~~~
   drivers/net/ethernet/sis/sis900.c:760:7: note: Taking false branch
           else if (!default_phy && phy_lan)
                ^
   drivers/net/ethernet/sis/sis900.c:762:12: note: 'default_phy' is null
           else if (!default_phy)
                     ^~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:762:7: note: Taking true branch
           else if (!default_phy)
                ^
   drivers/net/ethernet/sis/sis900.c:763:3: note: Null pointer value stored=
 to 'default_phy'
                   default_phy =3D sis_priv->first_mii;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:765:6: note: Assuming 'default_phy' is=
 not equal to field 'mii'
           if (sis_priv->mii !=3D default_phy) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:765:2: note: Taking true branch
           if (sis_priv->mii !=3D default_phy) {
           ^
   drivers/net/ethernet/sis/sis900.c:767:23: note: Access to field 'phy_add=
r' results in a dereference of a null pointer (loaded from variable 'defaul=
t_phy')
                   sis_priv->cur_phy =3D default_phy->phy_addr;
                                       ^~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:778:2: warning: Value stored to 'statu=
s' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:778:2: note: Value stored to 'status' =
is never read
           status =3D mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:1324:2: warning: Value stored to 'stat=
us' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:1324:2: note: Value stored to 'status'=
 is never read
           status =3D mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sis/sis900.c:1332:3: warning: Value stored to 'mii_=
phy' is never read [clang-analyzer-deadcode.DeadStores]
                   mii_phy =3D sis_priv->mii;

vim +4677 drivers/net/ethernet/realtek/r8169_main.c

e0b1115782b23f Hayes Wang 2021-11-29  4661  =

e0b1115782b23f Hayes Wang 2021-11-29  4662  static ssize_t
e0b1115782b23f Hayes Wang 2021-11-29  4663  ap_ready_show(struct device *de=
v, struct device_attribute *attr, char *buf)
e0b1115782b23f Hayes Wang 2021-11-29  4664  {
e0b1115782b23f Hayes Wang 2021-11-29  4665  	struct net_device *net =3D to_=
net_dev(dev);
e0b1115782b23f Hayes Wang 2021-11-29  4666  	struct rtl8169_private *tp =3D=
 netdev_priv(net);
e0b1115782b23f Hayes Wang 2021-11-29  4667  	bool enable;
e0b1115782b23f Hayes Wang 2021-11-29  4668  =

e0b1115782b23f Hayes Wang 2021-11-29  4669  	if (rtnl_lock_killable())
e0b1115782b23f Hayes Wang 2021-11-29  4670  		return -EINTR;
e0b1115782b23f Hayes Wang 2021-11-29  4671  =

e0b1115782b23f Hayes Wang 2021-11-29  4672  	enable =3D rtl_dash_get_ap_rea=
dy(tp->rtl_dash);
e0b1115782b23f Hayes Wang 2021-11-29  4673  =

e0b1115782b23f Hayes Wang 2021-11-29  4674  	rtnl_unlock();
e0b1115782b23f Hayes Wang 2021-11-29  4675  =

e0b1115782b23f Hayes Wang 2021-11-29  4676  	if (enable)
e0b1115782b23f Hayes Wang 2021-11-29 @4677  		strcat(buf, "enable\n");
e0b1115782b23f Hayes Wang 2021-11-29  4678  	else
e0b1115782b23f Hayes Wang 2021-11-29  4679  		strcat(buf, "disable\n");
e0b1115782b23f Hayes Wang 2021-11-29  4680  =

e0b1115782b23f Hayes Wang 2021-11-29  4681  	return (strlen(buf) + 1);
e0b1115782b23f Hayes Wang 2021-11-29  4682  }
e0b1115782b23f Hayes Wang 2021-11-29  4683  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3498423647227056480==--

