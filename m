Content-Type: multipart/mixed; boundary="===============5306889532507083438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [l1k:smsc95xx_5.17 642/888] drivers/gpu/drm/drm_bridge.c:828:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 09 Apr 2022 22:00:36 +0800
Message-ID: <202204092159.qJMAPfNf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5306889532507083438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Dom Cobley <popcornmix@gmail.com>

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   240f56c27361c195cd502d95aba51c6b8e5b808c
commit: 6f6042987b769f796264e6a449dc80555aa7f5b8 [642/888] drm/bridge: Intr=
oduce pre_enable_upstream_first to alter bridge init order
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220409/202204092159.qJMAPfNf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/l1k/linux/commit/6f6042987b769f796264e6a449dc8=
0555aa7f5b8
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout 6f6042987b769f796264e6a449dc80555aa7f5b8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           while (!list_empty(&map->debugfs_off_cache)) {
           ^
   drivers/base/regmap/regmap-debugfs.c:75:3: note: Calling 'list_del'
                   list_del(&c->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_st=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride =3D 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_strid=
e' is never read
                   min_stride =3D 0;
                   ^            ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: note: Value stored to 'tmp=
' is never read
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: warning: Value stored to =
'req' is never read [clang-analyzer-deadcode.DeadStores]
                                   req =3D list_entry(ep->queue.next,
                                   ^
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: note: Value stored to 're=
q' is never read
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: warning: Value stored to =
'count' is never read [clang-analyzer-deadcode.DeadStores]
                           count =3D AMD_GETBITS(count, UDC_EPSTS_RX_PKT_SI=
ZE);
                           ^
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: note: Value stored to 'co=
unt' is never read
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/misc/enclosure.c:186:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:186:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:187:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:187:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/drm_bridge.c:828:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           iter =3D limit;
                                ^
   drivers/gpu/drm/drm_bridge.c:583:2: note: Calling 'drm_atomic_bridge_cha=
in_pre_enable'
           drm_atomic_bridge_chain_pre_enable(bridge, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:783:35: note: 'limit' declared without an i=
nitial value
           struct drm_bridge *iter, *next, *limit;
                                            ^~~~~
   drivers/gpu/drm/drm_bridge.c:785:6: note: Assuming 'bridge' is non-null
           if (!bridge)
               ^~~~~~~
   drivers/gpu/drm/drm_bridge.c:785:2: note: Taking false branch
           if (!bridge)
           ^
   drivers/gpu/drm/drm_bridge.c:790:2: note: Loop condition is true.  Enter=
ing loop body
           list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_=
node) {
           ^
   include/linux/list.h:649:2: note: expanded from macro 'list_for_each_ent=
ry_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member);       =
  \
           ^
   drivers/gpu/drm/drm_bridge.c:791:7: note: Assuming field 'pre_enable_ups=
tream_first' is false
                   if (iter->pre_enable_upstream_first) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:791:3: note: Taking false branch
                   if (iter->pre_enable_upstream_first) {
                   ^
   drivers/gpu/drm/drm_bridge.c:823:3: note: Calling 'drm_atomic_bridge_cal=
l_pre_enable'
                   drm_atomic_bridge_call_pre_enable(iter, old_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:748:6: note: 'old_state' is null
           if (old_state && bridge->funcs->atomic_pre_enable) {
               ^~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:748:16: note: Left side of '&&' is false
           if (old_state && bridge->funcs->atomic_pre_enable) {
                         ^
   drivers/gpu/drm/drm_bridge.c:758:13: note: Assuming field 'pre_enable' i=
s non-null
           } else if (bridge->funcs->pre_enable) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:758:9: note: Taking true branch
           } else if (bridge->funcs->pre_enable) {
                  ^
   drivers/gpu/drm/drm_bridge.c:759:3: note: Value assigned to field 'pre_e=
nable_upstream_first', which participates in a condition later
                   bridge->funcs->pre_enable(bridge);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:823:3: note: Returning from 'drm_atomic_bri=
dge_call_pre_enable'
                   drm_atomic_bridge_call_pre_enable(iter, old_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:825:7: note: Assuming field 'pre_enable_ups=
tream_first' is true
                   if (iter->pre_enable_upstream_first)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:825:3: note: Taking true branch
                   if (iter->pre_enable_upstream_first)
                   ^
   drivers/gpu/drm/drm_bridge.c:828:9: note: Assigned value is garbage or u=
ndefined
                           iter =3D limit;
                                ^ ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/chemical/scd30_i2c.c:104:10: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
                   *rsp++ =3D buf[i];
                   ~~~~~~~^~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:70:2: note: 'rsp' initialized here
           char *rsp =3D response;
           ^~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:77:6: note: Assuming 'rsp' is null
           if (rsp) {
               ^~~
   drivers/iio/chemical/scd30_i2c.c:77:2: note: Taking false branch
           if (rsp) {
           ^
   drivers/iio/chemical/scd30_i2c.c:88:8: note: Assuming 'cmd' is equal to =
CMD_STOP_MEAS
                   if ((cmd =3D=3D CMD_STOP_MEAS) || (cmd =3D=3D CMD_RESET))
                        ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:88:30: note: Left side of '||' is true
                   if ((cmd =3D=3D CMD_STOP_MEAS) || (cmd =3D=3D CMD_RESET))
                                              ^
   drivers/iio/chemical/scd30_i2c.c:92:8: note: Calling 'scd30_i2c_xfer'
           ret =3D scd30_i2c_xfer(state, buf, i, buf, size);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:49:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/chemical/scd30_i2c.c:49:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/chemical/scd30_i2c.c:51:6: note: Assuming 'ret' is equal to =
'txsize'
           if (ret !=3D txsize)
               ^~~~~~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:51:2: note: Taking false branch
           if (ret !=3D txsize)
           ^
   drivers/iio/chemical/scd30_i2c.c:54:7: note: 'rxbuf' is non-null
           if (!rxbuf)
                ^~~~~
   drivers/iio/chemical/scd30_i2c.c:54:2: note: Taking false branch
           if (!rxbuf)
           ^
   drivers/iio/chemical/scd30_i2c.c:58:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)

vim +828 drivers/gpu/drm/drm_bridge.c

5ade071ba13e3bb Sean Paul       2019-06-11  762  =

5ade071ba13e3bb Sean Paul       2019-06-11  763  /**
ea099adfdf4bf35 Boris Brezillon 2019-12-03  764   * drm_atomic_bridge_chain=
_pre_enable - prepares for enabling all bridges in
ea099adfdf4bf35 Boris Brezillon 2019-12-03  765   *					the encoder chain
5ade071ba13e3bb Sean Paul       2019-06-11  766   * @bridge: bridge control=
 structure
f3fdbc721b8bc99 Boris Brezillon 2019-12-03  767   * @old_state: old atomic =
state
5ade071ba13e3bb Sean Paul       2019-06-11  768   *
5ade071ba13e3bb Sean Paul       2019-06-11  769   * Calls &drm_bridge_funcs=
.atomic_pre_enable (falls back on
5ade071ba13e3bb Sean Paul       2019-06-11  770   * &drm_bridge_funcs.pre_e=
nable) op for all the bridges in the encoder chain,
5ade071ba13e3bb Sean Paul       2019-06-11  771   * starting from the last =
bridge to the first. These are called before calling
5ade071ba13e3bb Sean Paul       2019-06-11  772   * &drm_encoder_helper_fun=
cs.atomic_enable
5ade071ba13e3bb Sean Paul       2019-06-11  773   *
6f6042987b769f7 Dave Stevenson  2021-12-16  774   * If a bridge sets @pre_e=
nable_upstream_first, then the pre_enable for the
6f6042987b769f7 Dave Stevenson  2021-12-16  775   * upstream bridge will be=
 called before pre_enable of this bridge.
6f6042987b769f7 Dave Stevenson  2021-12-16  776   *
5ade071ba13e3bb Sean Paul       2019-06-11  777   * Note: the bridge passed=
 should be the one closest to the encoder
5ade071ba13e3bb Sean Paul       2019-06-11  778   */
ea099adfdf4bf35 Boris Brezillon 2019-12-03  779  void drm_atomic_bridge_cha=
in_pre_enable(struct drm_bridge *bridge,
f3fdbc721b8bc99 Boris Brezillon 2019-12-03  780  					struct drm_atomic_sta=
te *old_state)
5ade071ba13e3bb Sean Paul       2019-06-11  781  {
05193dc38197021 Boris Brezillon 2019-12-03  782  	struct drm_encoder *encod=
er;
6f6042987b769f7 Dave Stevenson  2021-12-16  783  	struct drm_bridge *iter, =
*next, *limit;
05193dc38197021 Boris Brezillon 2019-12-03  784  =

5ade071ba13e3bb Sean Paul       2019-06-11  785  	if (!bridge)
5ade071ba13e3bb Sean Paul       2019-06-11  786  		return;
5ade071ba13e3bb Sean Paul       2019-06-11  787  =

05193dc38197021 Boris Brezillon 2019-12-03  788  	encoder =3D bridge->encod=
er;
6f6042987b769f7 Dave Stevenson  2021-12-16  789  =

05193dc38197021 Boris Brezillon 2019-12-03  790  	list_for_each_entry_rever=
se(iter, &encoder->bridge_chain, chain_node) {
6f6042987b769f7 Dave Stevenson  2021-12-16  791  		if (iter->pre_enable_ups=
tream_first) {
6f6042987b769f7 Dave Stevenson  2021-12-16  792  			next =3D iter;
6f6042987b769f7 Dave Stevenson  2021-12-16  793  			limit =3D bridge;
6f6042987b769f7 Dave Stevenson  2021-12-16  794  			list_for_each_entry_fro=
m_reverse(next,
6f6042987b769f7 Dave Stevenson  2021-12-16  795  							 &encoder->bridge_c=
hain,
6f6042987b769f7 Dave Stevenson  2021-12-16  796  							 chain_node) {
6f6042987b769f7 Dave Stevenson  2021-12-16  797  				if (next =3D=3D bridge)
6f6042987b769f7 Dave Stevenson  2021-12-16  798  					break;
41cf57124e0245e Boris Brezillon 2020-01-28  799  =

6f6042987b769f7 Dave Stevenson  2021-12-16  800  				if (!next->pre_enable_=
upstream_first) {
6f6042987b769f7 Dave Stevenson  2021-12-16  801  					/* Found first bridge=
 that does NOT
6f6042987b769f7 Dave Stevenson  2021-12-16  802  					 * request upstream t=
o be enabled first
6f6042987b769f7 Dave Stevenson  2021-12-16  803  					 */
6f6042987b769f7 Dave Stevenson  2021-12-16  804  					limit =3D list_prev_e=
ntry(next, chain_node);
6f6042987b769f7 Dave Stevenson  2021-12-16  805  					break;
6f6042987b769f7 Dave Stevenson  2021-12-16  806  				}
6f6042987b769f7 Dave Stevenson  2021-12-16  807  			}
41cf57124e0245e Boris Brezillon 2020-01-28  808  =

6f6042987b769f7 Dave Stevenson  2021-12-16  809  			list_for_each_entry_fro=
m(next, &encoder->bridge_chain, chain_node) {
6f6042987b769f7 Dave Stevenson  2021-12-16  810  				/* Call requested upst=
ream bridge pre_enable
6f6042987b769f7 Dave Stevenson  2021-12-16  811  				 * in order.
6f6042987b769f7 Dave Stevenson  2021-12-16  812  				 */
6f6042987b769f7 Dave Stevenson  2021-12-16  813  				if (next =3D=3D iter)
6f6042987b769f7 Dave Stevenson  2021-12-16  814  					/* At the first bridg=
ge to request upstream
6f6042987b769f7 Dave Stevenson  2021-12-16  815  					 * bridges called fir=
st.
6f6042987b769f7 Dave Stevenson  2021-12-16  816  					 */
6f6042987b769f7 Dave Stevenson  2021-12-16  817  					break;
6f6042987b769f7 Dave Stevenson  2021-12-16  818  =

6f6042987b769f7 Dave Stevenson  2021-12-16  819  				drm_atomic_bridge_call=
_pre_enable(next, old_state);
6f6042987b769f7 Dave Stevenson  2021-12-16  820  			}
41cf57124e0245e Boris Brezillon 2020-01-28  821  		}
5ade071ba13e3bb Sean Paul       2019-06-11  822  =

6f6042987b769f7 Dave Stevenson  2021-12-16  823  		drm_atomic_bridge_call_p=
re_enable(iter, old_state);
6f6042987b769f7 Dave Stevenson  2021-12-16  824  =

6f6042987b769f7 Dave Stevenson  2021-12-16  825  		if (iter->pre_enable_ups=
tream_first)
6f6042987b769f7 Dave Stevenson  2021-12-16  826  			/* Jump all bridges tha=
t we have already pre_enabled
6f6042987b769f7 Dave Stevenson  2021-12-16  827  			 */
6f6042987b769f7 Dave Stevenson  2021-12-16 @828  			iter =3D limit;
6f6042987b769f7 Dave Stevenson  2021-12-16  829  =

05193dc38197021 Boris Brezillon 2019-12-03  830  		if (iter =3D=3D bridge)
05193dc38197021 Boris Brezillon 2019-12-03  831  			break;
05193dc38197021 Boris Brezillon 2019-12-03  832  	}
5ade071ba13e3bb Sean Paul       2019-06-11  833  }
ea099adfdf4bf35 Boris Brezillon 2019-12-03  834  EXPORT_SYMBOL(drm_atomic_b=
ridge_chain_pre_enable);
5ade071ba13e3bb Sean Paul       2019-06-11  835  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5306889532507083438==--

