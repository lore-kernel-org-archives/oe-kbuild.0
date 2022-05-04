Content-Type: multipart/mixed; boundary="===============2865564074331259995=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lunn:dsa-ci 22/47] drivers/net/phy/mdio_bus.c:710:9: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 04 May 2022 20:37:50 +0800
Message-ID: <202205042049.SwDh4zxv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2865564074331259995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>

tree:   https://github.com/lunn/linux.git dsa-ci
head:   1149273e5c97f04e2255421372a8a30c75c0b842
commit: e582444c20a13a52eabf1d982d1f7e96344be2a8 [22/47] net: mdiobus: Rewo=
rk scanning of bus ready for quirks
:::::: branch date: 11 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
504/202205042049.SwDh4zxv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/e582444c20a13a52eabf1d982d1f=
7e96344be2a8
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn dsa-ci
        git checkout e582444c20a13a52eabf1d982d1f7e96344be2a8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:120:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e->traddr, traddr, NVMF_TRADDR_SIZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:120:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(e->traddr, traddr, NVMF_TRADDR_SIZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:121:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(e->tsas.common, port->disc_addr.tsas.common, NVMF_TSAS_SI=
ZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:121:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(e->tsas.common, port->disc_addr.tsas.common, NVMF_TSAS_SI=
ZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:122:2: warning: Call to function 'strncp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/target/discovery.c:122:2: note: Call to function 'strncpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'strncpy_s' in case of C11
           strncpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/target/discovery.c:141:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(traddr, port->disc_addr.traddr, NVMF_TRADDR_SIZE);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:141:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(traddr, port->disc_addr.traddr, NVMF_TRADDR_SIZE);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:269:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(id->sn, ctrl->subsys->serial, NVMET_SN_MAX_SIZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:269:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(id->sn, ctrl->subsys->serial, NVMET_SN_MAX_SIZE);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:270:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(id->fr, ' ', sizeof(id->fr));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/target/discovery.c:270:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(id->fr, ' ', sizeof(id->fr));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/net/phy/mdio_bus.c:235:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", val);
                  ^~~~~~~
   drivers/net/phy/mdio_bus.c:235:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", val);
                  ^~~~~~~
   drivers/net/phy/mdio_bus.c:254:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%llu\n", val);
                  ^~~~~~~
   drivers/net/phy/mdio_bus.c:254:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%llu\n", val);
                  ^~~~~~~
   drivers/net/phy/mdio_bus.c:497:2: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(mdiodev->modalias, bi->modalias,
           ^~~~~~~
   drivers/net/phy/mdio_bus.c:497:2: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
           strncpy(mdiodev->modalias, bi->modalias,
           ^~~~~~~
   drivers/net/phy/mdio_bus.c:511:21: warning: Value stored to 'phydev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:511:21: note: Value stored to 'phydev' during=
 its initialization is never read
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_bus.c:710:9: warning: The expression is an uninitia=
lized value. The computed value will also be garbage [clang-analyzer-core.u=
ninitialized.Assign]
           while (--i >=3D 0) {
                  ^ ~
   drivers/net/phy/mdio_bus.c:621:6: note: 'i' declared without an initial =
value
           int i, err;
               ^
   drivers/net/phy/mdio_bus.c:624:6: note: Assuming 'bus' is not equal to n=
ull
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/phy/mdio_bus.c:624:6: note: Left side of '||' is false
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   drivers/net/phy/mdio_bus.c:624:21: note: Assuming null is not equal to f=
ield 'name'
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
                              ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/phy/mdio_bus.c:624:2: note: '?' condition is false
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/phy/mdio_bus.c:624:14: note: 'bus' is not equal to null
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/net/phy/mdio_bus.c:624:6: note: Left side of '||' is false
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
               ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   drivers/net/phy/mdio_bus.c:624:21: note: Null is not equal to field 'nam=
e'
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
                              ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/net/phy/mdio_bus.c:624:2: note: '?' condition is false
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
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
   drivers/net/phy/mdio_bus.c:624:2: note: Taking false branch
           if (NULL =3D=3D bus || NULL =3D=3D bus->name)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/phy/mdio_bus.c:627:6: note: Assuming field 'read' is non-null
           if (!bus->read !=3D !bus->write)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +710 drivers/net/phy/mdio_bus.c

4ed8df519849887 Andrew Lunn            2022-04-20  603  =

b3df0da886ffdb3 Randy Dunlap           2007-03-06  604  /**
59f069789c98678 Russell King           2015-09-25  605   * __mdiobus_regist=
er - bring up all the PHYs on a given bus and attach them to bus
b3df0da886ffdb3 Randy Dunlap           2007-03-06  606   * @bus: target mii=
_bus
59f069789c98678 Russell King           2015-09-25  607   * @owner: module c=
ontaining bus accessor functions
e13934563db0470 Andy Fleming           2005-08-24  608   *
b3df0da886ffdb3 Randy Dunlap           2007-03-06  609   * Description: Cal=
led by a bus driver to bring up all the PHYs
59f069789c98678 Russell King           2015-09-25  610   *   on a given bus=
, and attach them to the bus. Drivers should use
59f069789c98678 Russell King           2015-09-25  611   *   mdiobus_regist=
er() rather than __mdiobus_register() unless they
f89df3f381f1e12 Andrew Lunn            2016-01-06  612   *   need to pass a=
 specific owner module. MDIO devices which are not
fec76125baf7390 Peng Li                2021-03-30  613   *   PHYs will not =
be brought up by this function. They are expected
f89df3f381f1e12 Andrew Lunn            2016-01-06  614   *   to be explicit=
ly listed in DT and instantiated by of_mdiobus_register().
b3df0da886ffdb3 Randy Dunlap           2007-03-06  615   *
b3df0da886ffdb3 Randy Dunlap           2007-03-06  616   * Returns 0 on suc=
cess or < 0 on error.
e13934563db0470 Andy Fleming           2005-08-24  617   */
3e3aaf649416988 Russell King           2015-09-24  618  int __mdiobus_regis=
ter(struct mii_bus *bus, struct module *owner)
e13934563db0470 Andy Fleming           2005-08-24  619  {
711fdba37a3dd7e Andrew Lunn            2016-01-06  620  	struct mdio_device=
 *mdiodev;
161c8d2f50109b4 Krzysztof Halasa       2008-12-25  621  	int i, err;
69226896ad636b9 Roger Quadros          2017-04-21  622  	struct gpio_desc *=
gpiod;
e13934563db0470 Andy Fleming           2005-08-24  623  =

effd7e805c90de8 Andrew Lunn            2022-04-02  624  	if (NULL =3D=3D bu=
s || NULL =3D=3D bus->name)
effd7e805c90de8 Andrew Lunn            2022-04-02  625  		return -EINVAL;
effd7e805c90de8 Andrew Lunn            2022-04-02  626  =

effd7e805c90de8 Andrew Lunn            2022-04-02  627  	if (!bus->read !=
=3D !bus->write)
effd7e805c90de8 Andrew Lunn            2022-04-02  628  		return -EINVAL;
effd7e805c90de8 Andrew Lunn            2022-04-02  629  =

effd7e805c90de8 Andrew Lunn            2022-04-02  630  	if (!bus->read_c45=
 !=3D !bus->write_c45)
effd7e805c90de8 Andrew Lunn            2022-04-02  631  		return -EINVAL;
effd7e805c90de8 Andrew Lunn            2022-04-02  632  =

effd7e805c90de8 Andrew Lunn            2022-04-02  633  	if (!bus->read && =
!bus->read_c45)
e13934563db0470 Andy Fleming           2005-08-24  634  		return -EINVAL;
e13934563db0470 Andy Fleming           2005-08-24  635  =

04f41c68f18886a Saravana Kannan        2021-09-15  636  	if (bus->parent &&=
 bus->parent->of_node)
04f41c68f18886a Saravana Kannan        2021-09-15  637  		bus->parent->of_n=
ode->fwnode.flags |=3D
04f41c68f18886a Saravana Kannan        2021-09-15  638  					FWNODE_FLAG_NE=
EDS_CHILD_BOUND_ON_ADD;
04f41c68f18886a Saravana Kannan        2021-09-15  639  =

867ae8a7993b26f Florian Fainelli       2021-11-17  640  	WARN(bus->state !=
=3D MDIOBUS_ALLOCATED &&
867ae8a7993b26f Florian Fainelli       2021-11-17  641  	     bus->state !=
=3D MDIOBUS_UNREGISTERED,
867ae8a7993b26f Florian Fainelli       2021-11-17  642  	     "%s: not in A=
LLOCATED or UNREGISTERED state\n", bus->id);
46abc02175b3c24 Lennert Buytenhek      2008-10-08  643  =

3e3aaf649416988 Russell King           2015-09-24  644  	bus->owner =3D own=
er;
46abc02175b3c24 Lennert Buytenhek      2008-10-08  645  	bus->dev.parent =
=3D bus->parent;
46abc02175b3c24 Lennert Buytenhek      2008-10-08  646  	bus->dev.class =3D=
 &mdio_bus_class;
46abc02175b3c24 Lennert Buytenhek      2008-10-08  647  	bus->dev.groups =
=3D NULL;
036b66879addb28 Stephen Hemminger      2009-02-26  648  	dev_set_name(&bus-=
>dev, "%s", bus->id);
46abc02175b3c24 Lennert Buytenhek      2008-10-08  649  =

ca6e11c337daf79 Pavel Skripkin         2021-09-30  650  	/* We need to set =
state to MDIOBUS_UNREGISTERED to correctly release
ca6e11c337daf79 Pavel Skripkin         2021-09-30  651  	 * the device in m=
diobus_free()
ca6e11c337daf79 Pavel Skripkin         2021-09-30  652  	 *
ca6e11c337daf79 Pavel Skripkin         2021-09-30  653  	 * State will be u=
pdated later in this function in case of success
ca6e11c337daf79 Pavel Skripkin         2021-09-30  654  	 */
ca6e11c337daf79 Pavel Skripkin         2021-09-30  655  	bus->state =3D MDI=
OBUS_UNREGISTERED;
ca6e11c337daf79 Pavel Skripkin         2021-09-30  656  =

46abc02175b3c24 Lennert Buytenhek      2008-10-08  657  	err =3D device_reg=
ister(&bus->dev);
46abc02175b3c24 Lennert Buytenhek      2008-10-08  658  	if (err) {
8d242488ce4627d Joe Perches            2012-06-09  659  		pr_err("mii_bus %=
s failed to register\n", bus->id);
46abc02175b3c24 Lennert Buytenhek      2008-10-08  660  		return -EINVAL;
46abc02175b3c24 Lennert Buytenhek      2008-10-08  661  	}
46abc02175b3c24 Lennert Buytenhek      2008-10-08  662  =

d1e7fe4d92742dd Adrian Bunk            2008-02-20  663  	mutex_init(&bus->m=
dio_lock);
6349084746ff4f5 Michael Walle          2020-05-06  664  	mutex_init(&bus->s=
hared_lock);
d1e7fe4d92742dd Adrian Bunk            2008-02-20  665  =

e0183b974d3008a Mike Looijmans         2021-02-02  666  	/* assert bus leve=
l PHY GPIO reset */
e0183b974d3008a Mike Looijmans         2021-02-02  667  	gpiod =3D devm_gpi=
od_get_optional(&bus->dev, "reset", GPIOD_OUT_HIGH);
69226896ad636b9 Roger Quadros          2017-04-21  668  	if (IS_ERR(gpiod))=
 {
0a12ad592955619 Grygorii Strashko      2020-11-19  669  		err =3D dev_err_p=
robe(&bus->dev, PTR_ERR(gpiod),
0a12ad592955619 Grygorii Strashko      2020-11-19  670  				    "mii_bus %s=
 couldn't get reset GPIO\n",
69226896ad636b9 Roger Quadros          2017-04-21  671  				    bus->id);
e40e2a2e78664fa Thomas Petazzoni       2019-01-16  672  		device_del(&bus->=
dev);
0a12ad592955619 Grygorii Strashko      2020-11-19  673  		return err;
fe0e4052fb11d5c Sergei Shtylyov        2017-06-12  674  	} else	if (gpiod) {
d396e84c56047b3 Sergei Shtylyov        2017-06-12  675  		bus->reset_gpiod =
=3D gpiod;
6259e0f5478d7a7 Bruno Thomsen          2020-07-30  676  		fsleep(bus->reset=
_delay_us);
69226896ad636b9 Roger Quadros          2017-04-21  677  		gpiod_set_value_c=
ansleep(gpiod, 0);
bb3831294cd5075 Bruno Thomsen          2020-07-30  678  		if (bus->reset_po=
st_delay_us > 0)
bb3831294cd5075 Bruno Thomsen          2020-07-30  679  			fsleep(bus->rese=
t_post_delay_us);
69226896ad636b9 Roger Quadros          2017-04-21  680  	}
69226896ad636b9 Roger Quadros          2017-04-21  681  =

c290d1ab12d3385 Florian Fainelli       2020-04-18  682  	if (bus->reset) {
c290d1ab12d3385 Florian Fainelli       2020-04-18  683  		err =3D bus->rese=
t(bus);
c290d1ab12d3385 Florian Fainelli       2020-04-18  684  		if (err)
c290d1ab12d3385 Florian Fainelli       2020-04-18  685  			goto error_reset=
_gpiod;
c290d1ab12d3385 Florian Fainelli       2020-04-18  686  	}
df0c8d911abf6ba Florian Fainelli       2017-05-11  687  =

e582444c20a13a5 Andrew Lunn            2022-04-20  688  	if (bus->probe_cap=
abilities =3D=3D MDIOBUS_NO_CAP ||
e582444c20a13a5 Andrew Lunn            2022-04-20  689  	    bus->probe_cap=
abilities =3D=3D MDIOBUS_C22 ||
e582444c20a13a5 Andrew Lunn            2022-04-20  690  	    bus->probe_cap=
abilities =3D=3D MDIOBUS_C22_C45) {
e582444c20a13a5 Andrew Lunn            2022-04-20  691  		err =3D mdiobus_s=
can_bus_c22(bus);
e582444c20a13a5 Andrew Lunn            2022-04-20  692  		if (err)
161c8d2f50109b4 Krzysztof Halasa       2008-12-25  693  			goto error;
161c8d2f50109b4 Krzysztof Halasa       2008-12-25  694  	}
e582444c20a13a5 Andrew Lunn            2022-04-20  695  =

e582444c20a13a5 Andrew Lunn            2022-04-20  696  	if (bus->probe_cap=
abilities =3D=3D MDIOBUS_C45 ||
e582444c20a13a5 Andrew Lunn            2022-04-20  697  	    bus->probe_cap=
abilities =3D=3D MDIOBUS_C22_C45) {
e582444c20a13a5 Andrew Lunn            2022-04-20  698  		err =3D mdiobus_s=
can_bus_c45(bus);
e582444c20a13a5 Andrew Lunn            2022-04-20  699  		if (err)
e582444c20a13a5 Andrew Lunn            2022-04-20  700  			goto error;
64b1c2b42b555ef Herbert Valerio Riedel 2006-05-10  701  	}
f896424cbc61225 Matt Porter            2005-11-02  702  =

d0281a56b00c63a Florian Fainelli       2017-03-28  703  	mdiobus_setup_mdio=
dev_from_board_info(bus, mdiobus_create_device);
648ea0134069cda Florian Fainelli       2017-02-04  704  =

e8e5752dc0a56a0 Krzysztof Halasa       2008-12-17  705  	bus->state =3D MDI=
OBUS_REGISTERED;
7590fc6f80ac2cb Florian Fainelli       2022-01-03  706  	dev_dbg(&bus->dev,=
 "probed\n");
161c8d2f50109b4 Krzysztof Halasa       2008-12-25  707  	return 0;
e13934563db0470 Andy Fleming           2005-08-24  708  =

161c8d2f50109b4 Krzysztof Halasa       2008-12-25  709  error:
161c8d2f50109b4 Krzysztof Halasa       2008-12-25 @710  	while (--i >=3D 0)=
 {
711fdba37a3dd7e Andrew Lunn            2016-01-06  711  		mdiodev =3D bus->=
mdio_map[i];
711fdba37a3dd7e Andrew Lunn            2016-01-06  712  		if (!mdiodev)
711fdba37a3dd7e Andrew Lunn            2016-01-06  713  			continue;
711fdba37a3dd7e Andrew Lunn            2016-01-06  714  =

711fdba37a3dd7e Andrew Lunn            2016-01-06  715  		mdiodev->device_r=
emove(mdiodev);
711fdba37a3dd7e Andrew Lunn            2016-01-06  716  		mdiodev->device_f=
ree(mdiodev);
161c8d2f50109b4 Krzysztof Halasa       2008-12-25  717  	}
c290d1ab12d3385 Florian Fainelli       2020-04-18  718  error_reset_gpiod:
69226896ad636b9 Roger Quadros          2017-04-21  719  	/* Put PHYs in RES=
ET to save power */
a010a2f6540ecc3 Florian Fainelli       2017-09-08  720  	if (bus->reset_gpi=
od)
d396e84c56047b3 Sergei Shtylyov        2017-06-12  721  		gpiod_set_value_c=
ansleep(bus->reset_gpiod, 1);
69226896ad636b9 Roger Quadros          2017-04-21  722  =

161c8d2f50109b4 Krzysztof Halasa       2008-12-25  723  	device_del(&bus->d=
ev);
4fd5f812c23c7de Lennert Buytenhek      2008-08-26  724  	return err;
4fd5f812c23c7de Lennert Buytenhek      2008-08-26  725  }
3e3aaf649416988 Russell King           2015-09-24  726  EXPORT_SYMBOL(__mdi=
obus_register);
4fd5f812c23c7de Lennert Buytenhek      2008-08-26  727  =


:::::: The code at line 710 was first introduced by commit
:::::: 161c8d2f50109b44b664eaf23831ea1587979a61 net: PHYLIB mdio fixes #2

:::::: TO: Krzysztof Halasa <khc@pm.waw.pl>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2865564074331259995==--

