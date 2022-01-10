Content-Type: multipart/mixed; boundary="===============2658415452392324401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC V1 net-next 3/4] net: Let the active time stamping layer be selectable.
Date: Mon, 10 Jan 2022 23:46:35 +0800
Message-ID: <202201102352.6hOYMc7y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2658415452392324401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220103232555.19791-4-richardcochran@gmail.com>
References: <20220103232555.19791-4-richardcochran@gmail.com>
TO: Richard Cochran <richardcochran@gmail.com>

Hi Richard,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Richard-Cochran/Make-MAC-P=
HY-time-stamping-selectable/20220104-072717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
3d694552fd8fe502e7ffd22ffa0e085bfd73b19a
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c007-20220105 (https://download.01.org/0day-ci/ar=
chive/20220110/202201102352.6hOYMc7y-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e3=
0ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/33070417b78b3844a2b2f55f9=
4313072859da977
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Richard-Cochran/Make-MAC-PHY-time-=
stamping-selectable/20220104-072717
        git checkout 33070417b78b3844a2b2f55f94313072859da977
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/infiniband/core/addr.c:508:28: note: Left side of '||' is false
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/infiniband/core/addr.c:508:28: note: Left side of '||' is false
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/infiniband/core/addr.c:508:28: note: Left side of '||' is true
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   drivers/infiniband/core/addr.c:508:28: note: Taking false branch
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/infiniband/core/addr.c:508:28: note: Loop condition is false.  E=
xiting loop
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   drivers/infiniband/core/addr.c:508:28: note: Dereference of null pointer
           struct net_device *ndev =3D READ_ONCE(dst->dev);
                                     ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   net/core/net-sysfs.c:632:2: warning: Value stored to 'ops' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:632:2: note: Value stored to 'ops' is never read
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:642:3: warning: Value stored to 'buf' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   buf +=3D 4;
                   ^      ~
   net/core/net-sysfs.c:642:3: note: Value stored to 'buf' is never read
                   buf +=3D 4;
                   ^      ~
>> net/core/net-sysfs.c:661:2: warning: Value stored to 'phydev' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           phydev =3D netdev->phydev;
           ^        ~~~~~~~~~~~~~~
   net/core/net-sysfs.c:661:2: note: Value stored to 'phydev' is never read
           phydev =3D netdev->phydev;
           ^        ~~~~~~~~~~~~~~
   net/core/net-sysfs.c:662:2: warning: Value stored to 'ops' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:662:2: note: Value stored to 'ops' is never read
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:1871:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1871:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/core/drop_monitor.c:870:2: warning: 1st function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           kfree(hw_metadata->fa_cookie);
           ^
   net/core/drop_monitor.c:941:6: note: Assuming field 'trap_type' is not e=
qual to DEVLINK_TRAP_TYPE_CONTROL
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/drop_monitor.c:941:2: note: '?' condition is false
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/drop_monitor.c:941:16: note: Field 'trap_type' is not equal to =
DEVLINK_TRAP_TYPE_CONTROL
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
                         ^
   net/core/drop_monitor.c:941:2: note: '?' condition is false
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
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
   net/core/drop_monitor.c:941:2: note: Taking false branch
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/drop_monitor.c:944:2: note: '?' condition is false
           if (!skb_mac_header_was_set(skb))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/drop_monitor.c:944:2: note: '?' condition is false
           if (!skb_mac_header_was_set(skb))
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
   net/core/drop_monitor.c:944:2: note: Taking false branch
           if (!skb_mac_header_was_set(skb))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/drop_monitor.c:948:6: note: Assuming 'nskb' is non-null
           if (!nskb)

vim +/phydev +661 net/core/net-sysfs.c

5fdd2f0e5c6484 Wei Wang        2021-02-08  620  =

c7ffd872b92c08 Richard Cochran 2022-01-03  621  static ssize_t available_ti=
mestamping_providers_show(struct device *dev,
c7ffd872b92c08 Richard Cochran 2022-01-03  622  						     struct device_at=
tribute *attr,
c7ffd872b92c08 Richard Cochran 2022-01-03  623  						     char *buf)
c7ffd872b92c08 Richard Cochran 2022-01-03  624  {
c7ffd872b92c08 Richard Cochran 2022-01-03  625  	const struct ethtool_ops *=
ops;
c7ffd872b92c08 Richard Cochran 2022-01-03  626  	struct net_device *netdev;
c7ffd872b92c08 Richard Cochran 2022-01-03  627  	struct phy_device *phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03  628  	int ret =3D 0;
c7ffd872b92c08 Richard Cochran 2022-01-03  629  =

c7ffd872b92c08 Richard Cochran 2022-01-03  630  	netdev =3D to_net_dev(dev);
c7ffd872b92c08 Richard Cochran 2022-01-03  631  	phydev =3D netdev->phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03 @632  	ops =3D netdev->ethtool_op=
s;
c7ffd872b92c08 Richard Cochran 2022-01-03  633  =

c7ffd872b92c08 Richard Cochran 2022-01-03  634  	if (!rtnl_trylock())
c7ffd872b92c08 Richard Cochran 2022-01-03  635  		return restart_syscall();
c7ffd872b92c08 Richard Cochran 2022-01-03  636  =

c7ffd872b92c08 Richard Cochran 2022-01-03  637  	ret +=3D sprintf(buf, "%s\=
n", "mac");
c7ffd872b92c08 Richard Cochran 2022-01-03  638  	buf +=3D 4;
c7ffd872b92c08 Richard Cochran 2022-01-03  639  =

c7ffd872b92c08 Richard Cochran 2022-01-03  640  	if (phy_has_tsinfo(phydev)=
) {
c7ffd872b92c08 Richard Cochran 2022-01-03  641  		ret +=3D sprintf(buf, "%s=
\n", "phy");
c7ffd872b92c08 Richard Cochran 2022-01-03  642  		buf +=3D 4;
c7ffd872b92c08 Richard Cochran 2022-01-03  643  	}
c7ffd872b92c08 Richard Cochran 2022-01-03  644  =

c7ffd872b92c08 Richard Cochran 2022-01-03  645  	rtnl_unlock();
c7ffd872b92c08 Richard Cochran 2022-01-03  646  =

c7ffd872b92c08 Richard Cochran 2022-01-03  647  	return ret;
c7ffd872b92c08 Richard Cochran 2022-01-03  648  }
c7ffd872b92c08 Richard Cochran 2022-01-03  649  static DEVICE_ATTR_RO(avail=
able_timestamping_providers);
c7ffd872b92c08 Richard Cochran 2022-01-03  650  =

c7ffd872b92c08 Richard Cochran 2022-01-03  651  static ssize_t current_time=
stamping_provider_show(struct device *dev,
c7ffd872b92c08 Richard Cochran 2022-01-03  652  						  struct device_attri=
bute *attr,
c7ffd872b92c08 Richard Cochran 2022-01-03  653  						  char *buf)
c7ffd872b92c08 Richard Cochran 2022-01-03  654  {
c7ffd872b92c08 Richard Cochran 2022-01-03  655  	const struct ethtool_ops *=
ops;
c7ffd872b92c08 Richard Cochran 2022-01-03  656  	struct net_device *netdev;
c7ffd872b92c08 Richard Cochran 2022-01-03  657  	struct phy_device *phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03  658  	int ret;
c7ffd872b92c08 Richard Cochran 2022-01-03  659  =

c7ffd872b92c08 Richard Cochran 2022-01-03  660  	netdev =3D to_net_dev(dev);
c7ffd872b92c08 Richard Cochran 2022-01-03 @661  	phydev =3D netdev->phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03  662  	ops =3D netdev->ethtool_op=
s;
c7ffd872b92c08 Richard Cochran 2022-01-03  663  =

c7ffd872b92c08 Richard Cochran 2022-01-03  664  	if (!rtnl_trylock())
c7ffd872b92c08 Richard Cochran 2022-01-03  665  		return restart_syscall();
c7ffd872b92c08 Richard Cochran 2022-01-03  666  =

33070417b78b38 Richard Cochran 2022-01-03  667  	switch (netdev->selected_t=
imestamping_layer) {
33070417b78b38 Richard Cochran 2022-01-03  668  	case MAC_TIMESTAMPING:
c7ffd872b92c08 Richard Cochran 2022-01-03  669  		ret =3D sprintf(buf, "%s\=
n", "mac");
33070417b78b38 Richard Cochran 2022-01-03  670  		break;
33070417b78b38 Richard Cochran 2022-01-03  671  	case PHY_TIMESTAMPING:
33070417b78b38 Richard Cochran 2022-01-03  672  		ret =3D sprintf(buf, "%s\=
n", "phy");
33070417b78b38 Richard Cochran 2022-01-03  673  		break;
c7ffd872b92c08 Richard Cochran 2022-01-03  674  	}
c7ffd872b92c08 Richard Cochran 2022-01-03  675  =

c7ffd872b92c08 Richard Cochran 2022-01-03  676  	rtnl_unlock();
c7ffd872b92c08 Richard Cochran 2022-01-03  677  =

c7ffd872b92c08 Richard Cochran 2022-01-03  678  	return ret;
c7ffd872b92c08 Richard Cochran 2022-01-03  679  }
33070417b78b38 Richard Cochran 2022-01-03  680  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2658415452392324401==--

