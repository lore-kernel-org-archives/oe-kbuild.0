Content-Type: multipart/mixed; boundary="===============2895637670926463833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 900/9128] drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 05:58:14 +0800
Message-ID: <202202270503.5LXGTm4H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2895637670926463833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Julian Grahsl <jgrahsl@snap.com>
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: b4436a18eedb8d93e148d009b145b4ae142e6f9d [900/9128] media: camss: a=
dd support for SM8250 camss
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220223 (https://download.01.org/0day-ci/arc=
hive/20220227/202202270503.5LXGTm4H-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db4436a18eedb8d93e148d009b145b4ae142e6f9d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b4436a18eedb8d93e148d009b145b4ae142e6f9d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^
   net/ipv4/devinet.c:996:7: note: Assuming the condition is false
                   if (IN_CLASSA(haddr))
                       ^
   include/uapi/linux/in.h:277:24: note: expanded from macro 'IN_CLASSA'
   #define IN_CLASSA(a)            ((((long int) (a)) & 0x80000000) =3D=3D =
0)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:996:3: note: Taking false branch
                   if (IN_CLASSA(haddr))
                   ^
   net/ipv4/devinet.c:998:12: note: Assuming the condition is false
                   else if (IN_CLASSB(haddr))
                            ^
   include/uapi/linux/in.h:283:24: note: expanded from macro 'IN_CLASSB'
   #define IN_CLASSB(a)            ((((long int) (a)) & 0xc0000000) =3D=3D =
0x80000000)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/ipv4/devinet.c:998:8: note: Taking false branch
                   else if (IN_CLASSB(haddr))
                        ^
   net/ipv4/devinet.c:1000:12: note: Assuming the condition is false
                   else if (IN_CLASSC(haddr))
                            ^
   include/uapi/linux/in.h:289:24: note: expanded from macro 'IN_CLASSC'
   #define IN_CLASSC(a)            ((((long int) (a)) & 0xe0000000) =3D=3D =
0xc0000000)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/ipv4/devinet.c:1000:8: note: Taking false branch
                   else if (IN_CLASSC(haddr))
                        ^
   net/ipv4/devinet.c:1002:12: note: Assuming the condition is false
                   else if (IN_CLASSE(haddr))
                            ^
   include/uapi/linux/in.h:301:24: note: expanded from macro 'IN_CLASSE'
   #define IN_CLASSE(a)            ((((long int) (a)) & 0xf0000000) =3D=3D =
0xf0000000)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/ipv4/devinet.c:1002:8: note: Taking false branch
                   else if (IN_CLASSE(haddr))
                        ^
   net/ipv4/devinet.c:1006:2: note: Returning the value -1 (loaded from 'rc=
'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   net/ipv4/devinet.c:1174:25: note: Returning from 'inet_abc_len'
                           ifa->ifa_prefixlen =3D inet_abc_len(ifa->ifa_add=
ress);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/ipv4/devinet.c:1175:20: note: Calling 'inet_make_mask'
                           ifa->ifa_mask =3D inet_make_mask(ifa->ifa_prefix=
len);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/inetdevice.h:288:6: note: 'logmask' is 255
           if (logmask)
               ^~~~~~~
   include/linux/inetdevice.h:288:2: note: Taking true branch
           if (logmask)
           ^
   include/linux/inetdevice.h:289:21: note: The result of the left shift is=
 undefined because the right operand is negative
                   return htonl(~((1U<<(32-logmask))-1));
                                     ^
   include/linux/byteorder/generic.h:139:27: note: expanded from macro 'hto=
nl'
   #define htonl(x) ___htonl(x)
                             ^
   include/linux/byteorder/generic.h:134:35: note: expanded from macro '___=
htonl'
   #define ___htonl(x) __cpu_to_be32(x)
                                     ^
   include/uapi/linux/byteorder/little_endian.h:40:53: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                                       ^
   include/uapi/linux/swab.h:118:32: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
                                         ^
   net/ipv4/devinet.c:1269:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1269:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1498:4: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1500:4: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1500:4: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1542:5: warning: Value stored to 'in_dev' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:1542:5: note: Value stored to 'in_dev' is never read
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: warning: Valu=
e stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: note: Value s=
tored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: warning: Valu=
e stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: note: Value s=
tored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: warning: Valu=
e stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: note: Value s=
tored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: warning: Valu=
e stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: note: Value s=
tored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:279:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:279:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:786:8: note: Calling 'c=
siphy_init_formats'
           ret =3D csiphy_init_formats(sd, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:546:12: note: 'fh' is n=
ull
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:546:12: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: 'fh' is n=
ull
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:31: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:555:9: note: Calling 'c=
siphy_set_format'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:510:6: note: 'format' i=
s not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:510:2: note: Taking fal=
se branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:6: note: Assuming f=
ield 'pad' is equal to MSM_CSIPHY_PAD_SINK
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:2: note: Taking tru=
e branch
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:519:40: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                                                        ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:519:12: note: Calling '=
__csiphy_get_format'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:6: note: Assuming '=
which' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:2: note: Taking tru=
e branch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:347:54: note: Passing n=
ull pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                                                                      ^~~~~=
~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:347:10: note: Calling '=
v4l2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:998:14: note: Assuming 'pad' is < field 'num=
_pads'
           if (WARN_ON(pad >=3D sd->entity.num_pads))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/media/v4l2-subdev.h:998:6: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/media/v4l2-subdev.h:998:2: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
           ^
   include/media/v4l2-subdev.h:1000:10: note: Access to field 'pads' result=
s in a dereference of a null pointer (loaded from variable 'state')
           return &state->pads[pad].try_fmt;
                   ^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t.c:14:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];

vim +/val +407 drivers/media/platform/qcom/camss/camss-csid-gen2.c

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  336  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  337  static void csid_configure_stream(struct csid_device=
 *csid, u8 enable)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  338  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  339  	struct csid_testgen_config *tg =3D &csid->testgen;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  340  	u32 val;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  341  	u32 phy_sel =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  342  	u8 lane_cnt =3D csid->phy.lane_cnt;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  343  	struct v4l2_mbus_framefmt *input_format =3D &csid->=
fmt[MSM_CSID_PAD_SRC];
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  344  	const struct csid_format *format =3D csid_get_fmt_e=
ntry(csid->formats, csid->nformats,
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  345  							      input_format->code);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  346  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  347  	if (!lane_cnt)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  348  		lane_cnt =3D 4;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  349  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  350  	if (!tg->enabled)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  351  		phy_sel =3D csid->phy.csiphy_id;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  352  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  353  	if (enable) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  354  		u8 vc =3D 0; /* Virtual Channel 0 */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  355  		u8 dt_id =3D vc * 4;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  356  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  357  		if (tg->enabled) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  358  			/* Config Test Generator */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  359  			vc =3D 0xa;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  360  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  361  			/* configure one DT, infinite frames */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  362  			val =3D vc << TPG_VC_CFG0_VC_NUM;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  363  			val |=3D INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0=
_LINE_INTERLEAVING_MODE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  364  			val |=3D 0 << TPG_VC_CFG0_NUM_FRAMES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  365  			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0=
);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  366  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  367  			val =3D 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  368  			val |=3D 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  369  			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1=
);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  370  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  371  			writel_relaxed(0x12345678, csid->base + CSID_TPG_=
LFSR_SEED);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  372  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  373  			val =3D input_format->height & 0x1fff << TPG_DT_n=
_CFG_0_FRAME_HEIGHT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  374  			val |=3D input_format->width & 0x1fff << TPG_DT_n=
_CFG_0_FRAME_WIDTH;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  375  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  376  =

14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  377  			val =3D format->data_type << TPG_DT_n_CFG_1_DATA_=
TYPE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  378  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_1(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  379  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  380  			val =3D tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  381  			val |=3D 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PA=
YLOAD;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  382  			val |=3D format->decode_format << TPG_DT_n_CFG_2_=
ENCODE_FORMAT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  383  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_2(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  384  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  385  			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BAR=
S_CFG);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  386  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  387  			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX=
_CFG);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  388  		}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  389  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  390  		val =3D 1 << RDI_CFG0_BYTE_CNTR_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  391  		val |=3D 1 << RDI_CFG0_FORMAT_MEASURE_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  392  		val |=3D 1 << RDI_CFG0_TIMESTAMP_EN;
14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  393  		/* note: for non-RDI path, this should be format->=
decode_format */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  394  		val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DE=
CODE_FORMAT;
14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  395  		val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  396  		val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  397  		val |=3D dt_id << RDI_CFG0_DT_ID;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  398  		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  399  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  400  		/* CSID_TIMESTAMP_STB_POST_IRQ */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  401  		val =3D 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  402  		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  403  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  404  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  405  		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP=
_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  406  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @407  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  408  		writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_P=
ATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  409  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  410  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  411  		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBS=
AMPLE_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  412  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  413  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  414  		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBS=
AMPLE_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  415  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  416  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  417  		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_=
DROP_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  418  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  419  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  420  		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_=
DROP_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  421  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  422  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  423  		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE=
_DROP_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  424  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  425  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  426  		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE=
_DROP_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  427  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  428  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  429  		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  430  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  431  		val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(0=
));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  432  		val |=3D  1 << RDI_CFG0_ENABLE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  433  		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  434  	}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  435  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  436  	if (tg->enabled) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  437  		val =3D enable << TPG_CTRL_TEST_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  438  		val |=3D 1 << TPG_CTRL_FS_PKT_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  439  		val |=3D 1 << TPG_CTRL_FE_PKT_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  440  		val |=3D (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LAN=
ES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  441  		val |=3D 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  442  		val |=3D 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  443  		writel_relaxed(val, csid->base + CSID_TPG_CTRL);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  444  	}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  445  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  446  	val =3D (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_L=
ANES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  447  	val |=3D csid->phy.lane_assign << CSI2_RX_CFG0_DL0_=
INPUT_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  448  	val |=3D phy_sel << CSI2_RX_CFG0_PHY_NUM_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  449  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  450  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  451  	val =3D 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  452  	val |=3D 1 << CSI2_RX_CFG1_MISR_EN;
7d8210851cb3db drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  453  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  454  =

ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  455  	if (enable)
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  456  		val =3D HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_C=
TRL_HALT_CMD;
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  457  	else
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  458  		val =3D HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTR=
L_HALT_CMD;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  459  	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  460  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  461  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  462  static int csid_configure_testgen_pattern(struct csi=
d_device *csid, s32 val)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  463  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  464  	if (val > 0 && val <=3D csid->testgen.nmodes)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  465  		csid->testgen.mode =3D val;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  466  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  467  	return 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  468  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  469  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  470  /*
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  471   * csid_hw_version - CSID hardware version query
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  472   * @csid: CSID device
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  473   *
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  474   * Return HW version or error
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  475   */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  476  static u32 csid_hw_version(struct csid_device *csid)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  477  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  478  	u32 hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  479  	u32 hw_gen;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  480  	u32 hw_rev;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  481  	u32 hw_step;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  482  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  483  	hw_version =3D readl_relaxed(csid->base + CSID_HW_V=
ERSION);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @484  	hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & =
0xF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @485  	hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0x=
FFF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @486  	hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0=
xFFFF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  487  	dev_dbg(csid->camss->dev, "CSID HW Version =3D %u.%=
u.%u\n",
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  488  		hw_gen, hw_rev, hw_step);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  489  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  490  	return hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  491  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  492  =


:::::: The code at line 407 was first introduced by commit
:::::: eebe6d00e9bf1216fb381b64146e1b7e50d90b3f media: camss: Add support f=
or CSID hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2895637670926463833==--

