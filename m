Content-Type: multipart/mixed; boundary="===============2072628079261876540=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 1/2] media: ovm6211: Adds support for OVM6211
Date: Sat, 12 Mar 2022 14:12:01 +0800
Message-ID: <202203121400.4UROVNpU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2072628079261876540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220309102215.891001-2-petko.manolov@konsulko.com>
References: <20220309102215.891001-2-petko.manolov@konsulko.com>
TO: Petko Manolov <petko.manolov@konsulko.com>
TO: linux-media(a)vger.kernel.org
CC: sakari.ailus(a)iki.fi
CC: devicetree(a)vger.kernel.org
CC: Petko Manolov <petko.manolov@konsulko.com>

Hi Petko,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 2b891d3980f6c255459d0e1c29ce2152ec7cf678]

url:    https://github.com/0day-ci/linux/commits/Petko-Manolov/media-ovm621=
1-Adds-support-for-OVM6211/20220309-182333
base:   2b891d3980f6c255459d0e1c29ce2152ec7cf678
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220310 (https://download.01.org/0day-ci/archi=
ve/20220312/202203121400.4UROVNpU-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/4894c38df725fcab9dc9ac03d=
8cffa97971279b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Petko-Manolov/media-ovm6211-Adds-s=
upport-for-OVM6211/20220309-182333
        git checkout 4894c38df725fcab9dc9ac03d8cffa97971279b7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/net_namespace.h:361:9: note: Access to field 'net' results i=
n a dereference of a null pointer (loaded from variable 'pnet')
           return pnet->net;
                  ^~~~
   net/core/dev.c:880:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:880:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:7151:19: warning: Access to field 'lower_level' results i=
n a dereference of a null pointer (loaded from variable 'dev') [clang-analy=
zer-core.NullDereference]
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
                            ^
   net/core/dev.c:7610:33: note: Passing value via 2nd parameter 'upper_dev'
           __netdev_upper_dev_unlink(dev, upper_dev, &priv);
                                          ^~~~~~~~~
   net/core/dev.c:7610:2: note: Calling '__netdev_upper_dev_unlink'
           __netdev_upper_dev_unlink(dev, upper_dev, &priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7574:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   net/core/dev.c:7574:2: note: '__ret_do_once' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:7574:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   net/core/dev.c:7574:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   net/core/dev.c:7576:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:7589:30: note: Passing null pointer value via 1st paramet=
er 'dev'
           __netdev_update_lower_level(upper_dev, priv);
                                       ^~~~~~~~~
   net/core/dev.c:7589:2: note: Calling '__netdev_update_lower_level'
           __netdev_update_lower_level(upper_dev, priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7151:19: note: Access to field 'lower_level' results in a=
 dereference of a null pointer (loaded from variable 'dev')
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
           ~~~              ^
   net/core/dev.c:10228:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dev->name, name);
           ^~~~~~
   net/core/dev.c:10228:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(dev->name, name);
           ^~~~~~
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/i2c/ov5695.c:1134:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ov5695_write_reg(ov5695->client, OV5695_REG_DIGI=
_GAIN_L,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/i2c/ov5695.c:1134:3: note: Value stored to 'ret' is never =
read
                   ret =3D ov5695_write_reg(ov5695->client, OV5695_REG_DIGI=
_GAIN_L,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/i2c/ovm6211.c:624:29: warning: Value stored to 'fmt' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct v4l2_mbus_framefmt *fmt =3D &format->format;
                                      ^~~   ~~~~~~~~~~~~~~~
   drivers/media/i2c/ovm6211.c:624:29: note: Value stored to 'fmt' during i=
ts initialization is never read
           struct v4l2_mbus_framefmt *fmt =3D &format->format;
                                      ^~~   ~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/soundwire/stream.c:1015:8: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
                           if (s_rt->slave !=3D slave)
                               ^
   drivers/soundwire/stream.c:1362:7: note: 'm_rt' is non-null
           if (!m_rt) {
                ^~~~
   drivers/soundwire/stream.c:1362:2: note: Taking false branch
           if (!m_rt) {
           ^
   drivers/soundwire/stream.c:1371:7: note: 's_rt' is non-null
           if (!s_rt) {
                ^~~~
   drivers/soundwire/stream.c:1371:2: note: Taking false branch
           if (!s_rt) {
           ^
   drivers/soundwire/stream.c:1380:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/soundwire/stream.c:1380:2: note: Taking false branch
           if (ret) {
           ^
   drivers/soundwire/stream.c:1394:6: note: 'ret' is -22
           if (ret)
               ^~~
   drivers/soundwire/stream.c:1394:2: note: Taking true branch
           if (ret)
           ^
   drivers/soundwire/stream.c:1395:3: note: Control jumps to line 1411
                   goto stream_error;
                   ^
   drivers/soundwire/stream.c:1411:2: note: Calling 'sdw_release_master_str=
eam'
           sdw_release_master_stream(m_rt, stream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1070:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry_safe(s_rt, _s_rt, &m_rt->slave_rt_list, m_rt=
_node) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/soundwire/stream.c:1072:3: note: Calling 'sdw_release_slave_stre=
am'
                   sdw_release_slave_stream(s_rt->slave, stream);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1041:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:1043:3: note: Loop condition is true.  Enteri=
ng loop body
                   list_for_each_entry_safe(s_rt, _s_rt,
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/soundwire/stream.c:1045:8: note: Assuming 'slave' is equal to fi=
eld 'slave'
                           if (s_rt->slave =3D=3D slave) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1045:4: note: Taking true branch
                           if (s_rt->slave =3D=3D slave) {
                           ^
   drivers/soundwire/stream.c:1047:5: note: Memory is released
                                   kfree(s_rt);
                                   ^~~~~~~~~~~
   drivers/soundwire/stream.c:1072:3: note: Returning; memory was released
                   sdw_release_slave_stream(s_rt->slave, stream);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/stream.c:1070:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry_safe(s_rt, _s_rt, &m_rt->slave_rt_list, m_rt=
_node) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/soundwire/stream.c:1071:3: note: Calling 'sdw_slave_port_release'
                   sdw_slave_port_release(s_rt->slave->bus, s_rt->slave, st=
ream);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/soundwire/stream.c:1013:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \

vim +/fmt +624 drivers/media/i2c/ovm6211.c

4894c38df725fc Petko Manolov 2022-03-09  618  =

4894c38df725fc Petko Manolov 2022-03-09  619  static int ovm6211_set_fmt(st=
ruct v4l2_subdev *sd,
4894c38df725fc Petko Manolov 2022-03-09  620  			   struct v4l2_subdev_stat=
e *state,
4894c38df725fc Petko Manolov 2022-03-09  621  			   struct v4l2_subdev_form=
at *format)
4894c38df725fc Petko Manolov 2022-03-09  622  {
4894c38df725fc Petko Manolov 2022-03-09  623  	struct ovm6211_dev *sensor =
=3D to_ovm6211_dev(sd);
4894c38df725fc Petko Manolov 2022-03-09 @624  	struct v4l2_mbus_framefmt *f=
mt =3D &format->format;
4894c38df725fc Petko Manolov 2022-03-09  625  	struct ovm6211_mode_info *mo=
de;
4894c38df725fc Petko Manolov 2022-03-09  626  =

4894c38df725fc Petko Manolov 2022-03-09  627  	mutex_lock(&sensor->lock);
4894c38df725fc Petko Manolov 2022-03-09  628  =

4894c38df725fc Petko Manolov 2022-03-09  629  	if (sensor->streaming)
4894c38df725fc Petko Manolov 2022-03-09  630  		return -EBUSY;
4894c38df725fc Petko Manolov 2022-03-09  631  =

4894c38df725fc Petko Manolov 2022-03-09  632  	/* these are hardcoded as we=
 don't support anything else */
4894c38df725fc Petko Manolov 2022-03-09  633  	format->format.colorspace  =
=3D V4L2_COLORSPACE_RAW;
4894c38df725fc Petko Manolov 2022-03-09  634  	format->format.field =3D V4L=
2_FIELD_NONE;
4894c38df725fc Petko Manolov 2022-03-09  635  	format->format.code =3D MEDI=
A_BUS_FMT_Y8_1X8;
4894c38df725fc Petko Manolov 2022-03-09  636  	mode =3D ovm6211_find_mode(f=
ormat->format.width, format->format.height);
4894c38df725fc Petko Manolov 2022-03-09  637  	format->format.width =3D mod=
e->width;
4894c38df725fc Petko Manolov 2022-03-09  638  	format->format.height =3D mo=
de->height;
4894c38df725fc Petko Manolov 2022-03-09  639  =

4894c38df725fc Petko Manolov 2022-03-09  640  	if (format->which =3D=3D V4L=
2_SUBDEV_FORMAT_TRY) {
4894c38df725fc Petko Manolov 2022-03-09  641  		fmt =3D v4l2_subdev_get_try=
_format(&sensor->sd, state, format->pad);
4894c38df725fc Petko Manolov 2022-03-09  642  		*fmt =3D format->format;
4894c38df725fc Petko Manolov 2022-03-09  643  		goto out;
4894c38df725fc Petko Manolov 2022-03-09  644  	}
4894c38df725fc Petko Manolov 2022-03-09  645  	sensor->cur_mode =3D mode;
4894c38df725fc Petko Manolov 2022-03-09  646  out:
4894c38df725fc Petko Manolov 2022-03-09  647  	mutex_unlock(&sensor->lock);
4894c38df725fc Petko Manolov 2022-03-09  648  =

4894c38df725fc Petko Manolov 2022-03-09  649  	return 0;
4894c38df725fc Petko Manolov 2022-03-09  650  }
4894c38df725fc Petko Manolov 2022-03-09  651  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2072628079261876540==--

