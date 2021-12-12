Content-Type: multipart/mixed; boundary="===============2968948876012473486=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/5] usb: typec: port-mapper: Convert to the component framework
Date: Sun, 12 Dec 2021 15:08:25 +0800
Message-ID: <202112121426.tlqFjKZE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2968948876012473486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211207143757.21895-5-heikki.krogerus@linux.intel.com>
References: <20211207143757.21895-5-heikki.krogerus@linux.intel.com>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Prashant Malani <pmalani@chromium.org>
CC: linux-acpi(a)vger.kernel.org
CC: linux-usb(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Heikki,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on rafael-pm/linux-next linus/master v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Heikki-Krogerus/acpi-Store=
-_PLD-information-and-convert-users/20211207-223940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-c001-20211207 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121426.tlqFjKZE-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/447d4051cf4a7ba3c5f9277c9=
45528a5efd787f3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Heikki-Krogerus/acpi-Store-_PLD-in=
formation-and-convert-users/20211207-223940
        git checkout 447d4051cf4a7ba3c5f9277c945528a5efd787f3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~
   drivers/net/ethernet/intel/ice/ice_devlink.c:619:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_devlink.c:676:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_devlink.c:676:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: warning: Value st=
ored to 'dev' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: note: Value store=
d to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/ethernet/intel/ice/ice_lag.c:65:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:65:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:67:2: warning: Value stored to =
'name' is never read [clang-analyzer-deadcode.DeadStores]
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:67:2: note: Value stored to 'na=
me' is never read
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:68:2: warning: Value stored to =
'peer' is never read [clang-analyzer-deadcode.DeadStores]
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:68:2: note: Value stored to 'pe=
er' is never read
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:69:2: warning: Value stored to =
'upper' is never read [clang-analyzer-deadcode.DeadStores]
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:69:2: note: Value stored to 'up=
per' is never read
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:70:2: warning: Value stored to =
'master' is never read [clang-analyzer-deadcode.DeadStores]
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:70:2: note: Value stored to 'ma=
ster' is never read
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:71:2: warning: Value stored to =
'bonded' is never read [clang-analyzer-deadcode.DeadStores]
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:71:2: note: Value stored to 'bo=
nded' is never read
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:75:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:75:3: note: Value stored to 'ro=
le' is never read
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: note: Value stored to 'ro=
le' is never read
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: note: Value stored to 'ro=
le' is never read
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: note: Value stored to 'ro=
le' is never read
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: note: Value stored to 'ro=
le' is never read
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:348:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_lag.c:348:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/usb/typec/port-mapper.c:45:2: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           list_for_each_entry(adev, &location->devices, location_list) {
           ^
   include/linux/list.h:632:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/usb/typec/port-mapper.c:40:38: note: Assuming the condition is t=
rue
           location =3D acpi_device_get_location(ACPI_COMPANION(&con->dev));
                                               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:426:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/port-mapper.c:40:38: note: '?' condition is true
           location =3D acpi_device_get_location(ACPI_COMPANION(&con->dev));
                                               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:426:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/usb/typec/port-mapper.c:41:6: note: Assuming 'location' is non-n=
ull
           if (!location)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/typec/port-mapper.c:41:2: note: '?' condition is false
           if (!location)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/typec/port-mapper.c:41:7: note: 'location' is non-null
           if (!location)
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
   drivers/usb/typec/port-mapper.c:41:2: note: '?' condition is false
           if (!location)
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
   drivers/usb/typec/port-mapper.c:41:2: note: Taking false branch
           if (!location)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/typec/port-mapper.c:45:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(adev, &location->devices, location_list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/usb/typec/port-mapper.c:46:15: note: Assuming the condition is f=
alse
                   if (adev =3D=3D ACPI_COMPANION(&con->dev))
                               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:426:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +45 drivers/usb/typec/port-mapper.c

ae196ddb0d3186 Heikki Krogerus 2021-04-07  33  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  34  int typec_link_ports(struct =
typec_port *con)
ae196ddb0d3186 Heikki Krogerus 2021-04-07  35  {
447d4051cf4a7b Heikki Krogerus 2021-12-07  36  	struct acpi_device_location=
 *location;
447d4051cf4a7b Heikki Krogerus 2021-12-07  37  	struct component_match *mat=
ch =3D NULL;
447d4051cf4a7b Heikki Krogerus 2021-12-07  38  	struct acpi_device *adev;
ae196ddb0d3186 Heikki Krogerus 2021-04-07  39  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  40  	location =3D acpi_device_ge=
t_location(ACPI_COMPANION(&con->dev));
447d4051cf4a7b Heikki Krogerus 2021-12-07  41  	if (!location)
ae196ddb0d3186 Heikki Krogerus 2021-04-07  42  		return 0;
ae196ddb0d3186 Heikki Krogerus 2021-04-07  43  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  44  	/* Component match for ever=
y device that shares the same _PLD. */
447d4051cf4a7b Heikki Krogerus 2021-12-07 @45  	list_for_each_entry(adev, &=
location->devices, location_list) {
447d4051cf4a7b Heikki Krogerus 2021-12-07  46  		if (adev =3D=3D ACPI_COMPA=
NION(&con->dev))
447d4051cf4a7b Heikki Krogerus 2021-12-07  47  			continue;
ae196ddb0d3186 Heikki Krogerus 2021-04-07  48  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  49  		component_match_add(&con->=
dev, &match, typec_port_compare,
447d4051cf4a7b Heikki Krogerus 2021-12-07  50  				    acpi_fwnode_handle(a=
dev));
ae196ddb0d3186 Heikki Krogerus 2021-04-07  51  	}
ae196ddb0d3186 Heikki Krogerus 2021-04-07  52  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  53  	/*
447d4051cf4a7b Heikki Krogerus 2021-12-07  54  	 * REVISIT: Now each connec=
tor can have only a single component master.
447d4051cf4a7b Heikki Krogerus 2021-12-07  55  	 * So far only the USB port=
s connected to the USB Type-C connector share
447d4051cf4a7b Heikki Krogerus 2021-12-07  56  	 * the _PLD with it, but if=
 there one day is something else (like maybe
447d4051cf4a7b Heikki Krogerus 2021-12-07  57  	 * the DisplayPort ACPI dev=
ice object) that also shares the _PLD with
447d4051cf4a7b Heikki Krogerus 2021-12-07  58  	 * the connector, every one=
 of those needs to have its own component
447d4051cf4a7b Heikki Krogerus 2021-12-07  59  	 * master, because each dif=
ferent type of component needs to be bind to
447d4051cf4a7b Heikki Krogerus 2021-12-07  60  	 * the connector independen=
tly of the other components. That requires
447d4051cf4a7b Heikki Krogerus 2021-12-07  61  	 * improvements to the comp=
onent framework. Right now you can only have
447d4051cf4a7b Heikki Krogerus 2021-12-07  62  	 * one master per device.
ae196ddb0d3186 Heikki Krogerus 2021-04-07  63  	 */
ee64fc599b721c Heikki Krogerus 2021-04-07  64  =

447d4051cf4a7b Heikki Krogerus 2021-12-07  65  	return component_master_add=
_with_match(&con->dev, &typec_aggregate_ops, match);
ee64fc599b721c Heikki Krogerus 2021-04-07  66  }
ee64fc599b721c Heikki Krogerus 2021-04-07  67  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2968948876012473486==--

