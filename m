Content-Type: multipart/mixed; boundary="===============5709960042071425027=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next: PATCH 07/12] net: mdio: allow registering non-PHY devices in ACPI world
Date: Tue, 21 Jun 2022 12:37:54 +0800
Message-ID: <202206211240.eoGOEICS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5709960042071425027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/rwonce.h:44:26: warning: dereference of NULL '<unknown=
>' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220620150225.1307946-8-mw@semihalf.com>
References: <20220620150225.1307946-8-mw@semihalf.com>
TO: Marcin Wojtas <mw@semihalf.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-acpi(a)vger.kernel.org
TO: netdev(a)vger.kernel.org
CC: rafael(a)kernel.org
CC: andriy.shevchenko(a)linux.intel.com
CC: lenb(a)kernel.org
CC: andrew(a)lunn.ch
CC: vivien.didelot(a)gmail.com
CC: f.fainelli(a)gmail.com
CC: olteanv(a)gmail.com
CC: davem(a)davemloft.net
CC: edumazet(a)google.com
CC: kuba(a)kernel.org
CC: pabeni(a)redhat.com
CC: linux(a)armlinux.org.uk
CC: hkallweit1(a)gmail.com
CC: gjb(a)semihalf.com
CC: mw(a)semihalf.com
CC: jaz(a)semihalf.com
CC: tn(a)semihalf.com
CC: Samer.El-Haj-Mahmoud(a)arm.com
CC: upstream(a)semihalf.com

Hi Marcin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on robh/for-next linus/master v5.19-rc2 next-20220=
617]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcin-Wojtas/ACPI-s=
upport-for-DSA/20220620-231646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
621/202206211240.eoGOEICS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3971d5dc91ab6b9c21f=
20cc7c431aca0a8ea6740
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marcin-Wojtas/ACPI-support-for-DSA=
/20220620-231646
        git checkout 3971d5dc91ab6b9c21f20cc7c431aca0a8ea6740
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
       |   65 | int acpi_mdiobus_register(struct mii_bus *mdio, struct fwno=
de_handle *fwnode)
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'acpi_mdiobus_register.part.0'
       |
     'acpi_mdiobus_register.part.0': event 2
       |
       |   80 |         fwnode_for_each_child_node(fwnode, child) {
       |      |                                            ^~~~~
       |      |                                            |
       |      |                                            (2) following 't=
rue' branch (when 'child' is non-NULL)...
   include/linux/property.h:105:64: note: in definition of macro 'fwnode_fo=
r_each_child_node'
       |  105 |         for (child =3D fwnode_get_next_child_node(fwnode, N=
ULL); child;   \
       |      |                                                            =
    ^~~~~
       |
     'acpi_mdiobus_register.part.0': event 3
       |
       |include/acpi/acpi_bus.h:421:17:
       |  421 |                 is_acpi_device_node(__to_acpi_device_node_f=
wnode) ?     \
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                 |
       |      |                 (3) ...to here
   include/linux/acpi.h:48:52: note: in expansion of macro 'to_acpi_device_=
node'
       |   48 |                                 acpi_device_handle(to_acpi_=
device_node(fwnode))
       |      |                                                    ^~~~~~~~=
~~~~~~~~~~~
   drivers/net/mdio/acpi_mdio.c:81:46: note: in expansion of macro 'ACPI_HA=
NDLE_FWNODE'
       |   81 |                 ret =3D acpi_get_local_address(ACPI_HANDLE_=
FWNODE(child), &addr);
       |      |                                              ^~~~~~~~~~~~~~=
~~~~
       |
     'acpi_mdiobus_register.part.0': events 4-6
       |
       |   82 |                 if (ret || addr >=3D PHY_MAX_ADDR)
       |      |                    ^
       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       |   85 |                 if (acpi_mdiobus_child_is_phy(child))
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (5) ...to here
       |      |                     (6) calling 'acpi_mdiobus_child_is_phy'=
 from 'acpi_mdiobus_register.part.0'
       |
       +--> 'acpi_mdiobus_child_is_phy': event 7
              |
              |   32 | static bool acpi_mdiobus_child_is_phy(struct fwnode_=
handle *child)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'acpi_mdiobus_child_is_phy'
              |
            'acpi_mdiobus_child_is_phy': event 8
              |
              |include/acpi/acpi_bus.h:423:66:
              |  423 |                                      struct acpi_dev=
ice, fwnode) :      \
   drivers/net/mdio/acpi_mdio.c:34:36: note: in expansion of macro 'to_acpi=
_device_node'
              |   34 |         struct acpi_device *adev =3D to_acpi_device_=
node(child);
              |      |                                    ^~~~~~~~~~~~~~~~~=
~~
              |
            'acpi_mdiobus_child_is_phy': events 9-15
              |
              |   37 |         if (fwnode_get_phy_id(child, &phy_id) !=3D -=
EINVAL)
              |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(9) ...to here
              |      |            (10) following 'false' branch...
              |......
              |   40 |         if (fwnode_property_match_string(child, "com=
patible",
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |            ||
              |      |            |(11) ...to here
              |      |            (12) following 'false' branch...
              |   41 |                                          "ethernet-p=
hy-ieee802.3-c45") =3D=3D 0)
              |      |                                          ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
              |......
              |   44 |         if (fwnode_property_match_string(child, "com=
patible",
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |            ||
              |      |            |(13) ...to here
              |      |            (14) following 'false' branch...
              |   45 |                                          "ethernet-p=
hy-ieee802.3-c22") =3D=3D 0)
              |      |                                          ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
              |......
              |   49 |         if (list_empty(&adev->pnp.ids))
              |      |                        ~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (15) ...to here
              |
            'acpi_mdiobus_child_is_phy': event 16
              |
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (16) dereference of NULL '<=
unknown>'
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
              |   50 |         __READ_ONCE(x);                             =
                    \
              |      |         ^~~~~~~~~~~
   include/linux/list.h:292:16: note: in expansion of macro 'READ_ONCE'
              |  292 |         return READ_ONCE(head->next) =3D=3D head;
              |      |                ^~~~~~~~~
              |
>> include/asm-generic/rwonce.h:44:26: warning: dereference of NULL '<unkno=
wn>' [CWE-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/list.h:292:16: note: in expansion of macro 'READ_ONCE'
     292 |         return READ_ONCE(head->next) =3D=3D head;
         |                ^~~~~~~~~
     'acpi_mdiobus_register.part.0': event 1
       |
       |drivers/net/mdio/acpi_mdio.c:65:5:
       |   65 | int acpi_mdiobus_register(struct mii_bus *mdio, struct fwno=
de_handle *fwnode)
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'acpi_mdiobus_register.part.0'
       |
     'acpi_mdiobus_register.part.0': event 2
       |
       |   80 |         fwnode_for_each_child_node(fwnode, child) {
       |      |                                            ^~~~~
       |      |                                            |
       |      |                                            (2) following 't=
rue' branch (when 'child' is non-NULL)...
   include/linux/property.h:105:64: note: in definition of macro 'fwnode_fo=
r_each_child_node'
       |  105 |         for (child =3D fwnode_get_next_child_node(fwnode, N=
ULL); child;   \
       |      |                                                            =
    ^~~~~
       |
     'acpi_mdiobus_register.part.0': event 3
       |
       |include/acpi/acpi_bus.h:421:17:
       |  421 |                 is_acpi_device_node(__to_acpi_device_node_f=
wnode) ?     \
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                 |
       |      |                 (3) ...to here
   include/linux/acpi.h:48:52: note: in expansion of macro 'to_acpi_device_=
node'
       |   48 |                                 acpi_device_handle(to_acpi_=
device_node(fwnode))
       |      |                                                    ^~~~~~~~=
~~~~~~~~~~~
   drivers/net/mdio/acpi_mdio.c:81:46: note: in expansion of macro 'ACPI_HA=
NDLE_FWNODE'
       |   81 |                 ret =3D acpi_get_local_address(ACPI_HANDLE_=
FWNODE(child), &addr);
       |      |                                              ^~~~~~~~~~~~~~=
~~~~
       |
     'acpi_mdiobus_register.part.0': event 4
       |
       |include/acpi/acpi_bus.h:423:66:
       |  423 |                                      struct acpi_device, fw=
node) :      \
   include/linux/acpi.h:48:52: note: in expansion of macro 'to_acpi_device_=
node'
       |   48 |                                 acpi_device_handle(to_acpi_=
device_node(fwnode))
       |      |                                                    ^~~~~~~~=
~~~~~~~~~~~
   drivers/net/mdio/acpi_mdio.c:81:46: note: in expansion of macro 'ACPI_HA=
NDLE_FWNODE'
       |   81 |                 ret =3D acpi_get_local_address(ACPI_HANDLE_=
FWNODE(child), &addr);
       |      |                                              ^~~~~~~~~~~~~~=
~~~~
       |
     'acpi_mdiobus_register.part.0': event 5
       |
       |include/linux/container_of.h:22:10:
       |   22 |         ((type *)(__mptr - offsetof(type, member))); })
       |      |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |          |
       |      |          (5) ...to here
   include/acpi/acpi_bus.h:422:25: note: in expansion of macro 'container_o=
f'
       |  422 |                         container_of(__to_acpi_device_node_=
fwnode,      \
       |      |                         ^~~~~~~~~~~~
   include/linux/acpi.h:48:52: note: in expansion of macro 'to_acpi_device_=
node'
       |   48 |                                 acpi_device_handle(to_acpi_=
device_node(fwnode))
       |      |                                                    ^~~~~~~~=
~~~~~~~~~~~
   drivers/net/mdio/acpi_mdio.c:81:46: note: in expansion of macro 'ACPI_HA=
NDLE_FWNODE'
       |   81 |                 ret =3D acpi_get_local_address(ACPI_HANDLE_=
FWNODE(child), &addr);
       |      |                                              ^~~~~~~~~~~~~~=
~~~~
       |
     'acpi_mdiobus_register.part.0': event 6
       |
       |include/linux/acpi.h:40:36:
       |   40 |         return adev ? adev->handle : NULL;
       |
     'acpi_mdiobus_register.part.0': events 7-10
       |
       |drivers/net/mdio/acpi_mdio.c:81:23:
       |   81 |                 ret =3D acpi_get_local_address(ACPI_HANDLE_=
FWNODE(child), &addr);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (7) ...to here
       |   82 |                 if (ret || addr >=3D PHY_MAX_ADDR)
       |      |                    ~   =

       |      |                    |
       |      |                    (8) following 'false' branch...
       |......
       |   85 |                 if (acpi_mdiobus_child_is_phy(child))
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (9) ...to here
       |      |                     (10) calling 'acpi_mdiobus_child_is_phy=
' from 'acpi_mdiobus_register.part.0'
       |
       +--> 'acpi_mdiobus_child_is_phy': event 11
              |
              |   32 | static bool acpi_mdiobus_child_is_phy(struct fwnode_=
handle *child)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (11) entry to 'acpi_mdiobus_child_is_phy'
              |
            'acpi_mdiobus_child_is_phy': event 12
              |

vim +44 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  28  =

e506ea451254ab Will Deacon 2019-10-15  29  /*
e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit acce=
sses on 32-bit architectures. These will
e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some ca=
ses (namely Armv7 + LPAE), but for others we
e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being spli=
t into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) and =
a strong prevailing wind.
e506ea451254ab Will Deacon 2019-10-15  34   */
e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwonc=
e_type(t)					\
e506ea451254ab Will Deacon 2019-10-15  36  	compiletime_assert(__native_wor=
d(t) || sizeof(t) =3D=3D sizeof(long long),	\
e506ea451254ab Will Deacon 2019-10-15  37  		"Unsupported access size for {=
READ,WRITE}_ONCE().")
e506ea451254ab Will Deacon 2019-10-15  38  =

e506ea451254ab Will Deacon 2019-10-15  39  /*
e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of =
READ_ONCE() if you do not require any
3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this may=
 result in tears!
e506ea451254ab Will Deacon 2019-10-15  42   */
b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const =
volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
e506ea451254ab Will Deacon 2019-10-15  46  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5709960042071425027==--

