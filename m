Content-Type: multipart/mixed; boundary="===============8241082276540176326=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/preempt-rt 10964/19278] drivers/media/v4l2-core/v4l2-mc.c:437:23: warning: Value stored to 'entity' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 08 Dec 2021 18:58:21 +0800
Message-ID: <202112081710.U3uVHK5v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8241082276540176326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Li Wei <wei.l.li@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>
CC: Chen Meng J <meng.j.chen@intel.com>
CC: Meng Wei <wei.meng@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   c287378636ba3f627b4da448d62a75ed41a35982
commit: 91c71f14b406b0fe0f72f7e75e6a85e344b1927a [10964/19278] media: v4l2-=
mc: fix entity use_count issue for dual sensors
:::::: branch date: 9 days ago
:::::: commit date: 5 months ago
config: i386-randconfig-c001-20211204 (https://download.01.org/0day-ci/arch=
ive/20211208/202112081710.U3uVHK5v-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d18=
54eb1450d352663ee732235893c5782237)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/91c71f14b406b0fe0=
f72f7e75e6a85e344b1927a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout 91c71f14b406b0fe0f72f7e75e6a85e344b1927a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:143:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:130:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:118:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x156' is < '__UNIQUE_ID=
___y157'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:143:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:130:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:143:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:130:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/v4l2-core/v4l2-async.c:463:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:463:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D
                          ^~~
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
   5 warnings generated.
   drivers/media/v4l2-core/v4l2-mc.c:176:4: warning: Value stored to 'if_au=
d' is never read [clang-analyzer-deadcode.DeadStores]
                           if_aud =3D tuner;
                           ^        ~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:176:4: note: Value stored to 'if_aud' =
is never read
                           if_aud =3D tuner;
                           ^        ~~~~~
>> drivers/media/v4l2-core/v4l2-mc.c:437:23: warning: Value stored to 'enti=
ty' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct media_entity *entity =3D pad->entity;
                                ^~~~~~   ~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:437:23: note: Value stored to 'entity'=
 during its initialization is never read
           struct media_entity *entity =3D pad->entity;
                                ^~~~~~   ~~~~~~~~~~~
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
   3 warnings generated.
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
   3 warnings generated.
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
   3 warnings generated.
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
   4 warnings generated.
   fs/cifs/asn1.c:113:8: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           *ch =3D *(ctx->pointer)++;
                 ^
   fs/cifs/asn1.c:486:2: note: 'ctx' initialized here
           struct asn1_ctx ctx;
           ^~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:497:2: note: Taking false branch
           if (asn1_header_decode(&ctx, &end, &cls, &con, &tag) =3D=3D 0) {
           ^
   fs/cifs/asn1.c:500:14: note: Assuming 'cls' is equal to ASN1_APL
           } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
                       ^~~~~~~~~~~~~~~
   fs/cifs/asn1.c:500:13: note: Left side of '||' is false
           } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
                      ^
   fs/cifs/asn1.c:500:35: note: Assuming 'con' is equal to ASN1_CON
           } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
                                            ^~~~~~~~~~~~~~~
   fs/cifs/asn1.c:500:13: note: Left side of '||' is false
           } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
                      ^
   fs/cifs/asn1.c:501:10: note: Assuming 'tag' is equal to ASN1_EOC
                      || (tag !=3D ASN1_EOC)) {
                          ^~~~~~~~~~~~~~~
   fs/cifs/asn1.c:500:9: note: Taking false branch
           } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
                  ^
   fs/cifs/asn1.c:507:7: note: Calling 'asn1_header_decode'
           rc =3D asn1_header_decode(&ctx, &end, &cls, &con, &tag);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:219:7: note: Calling 'asn1_id_decode'
           if (!asn1_id_decode(ctx, cls, con, tag))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:161:7: note: Calling 'asn1_octet_decode'
           if (!asn1_octet_decode(ctx, &ch))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:109:6: note: Assuming field 'pointer' is < field 'end'
           if (ctx->pointer >=3D ctx->end) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:109:2: note: Taking false branch
           if (ctx->pointer >=3D ctx->end) {
           ^
   fs/cifs/asn1.c:114:2: note: Returning the value 1, which participates in=
 a condition later
           return 1;
           ^~~~~~~~
   fs/cifs/asn1.c:161:7: note: Returning from 'asn1_octet_decode'
           if (!asn1_octet_decode(ctx, &ch))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/asn1.c:161:2: note: Taking false branch
           if (!asn1_octet_decode(ctx, &ch))
           ^
   fs/cifs/asn1.c:168:6: note: Assuming the condition is true
           if (*tag =3D=3D 0x1F) {
               ^~~~~~~~~~~~
   fs/cifs/asn1.c:168:2: note: Taking true branch
           if (*tag =3D=3D 0x1F) {
           ^
   fs/cifs/asn1.c:169:7: note: Assuming the condition is false
                   if (!asn1_tag_decode(ctx, tag))

vim +/entity +437 drivers/media/v4l2-core/v4l2-mc.c

0d3c81e82da90f Steve Longerbeam 2020-05-01  406  =

76413791a03f8f Sakari Ailus     2016-02-21  407  /* -----------------------=
------------------------------------------------------
76413791a03f8f Sakari Ailus     2016-02-21  408   * Pipeline power manageme=
nt
76413791a03f8f Sakari Ailus     2016-02-21  409   *
76413791a03f8f Sakari Ailus     2016-02-21  410   * Entities must be powere=
d up when part of a pipeline that contains at least
76413791a03f8f Sakari Ailus     2016-02-21  411   * one open video device n=
ode.
76413791a03f8f Sakari Ailus     2016-02-21  412   *
76413791a03f8f Sakari Ailus     2016-02-21  413   * To achieve this use the=
 entity use_count field to track the number of users.
76413791a03f8f Sakari Ailus     2016-02-21  414   * For entities correspond=
ing to video device nodes the use_count field stores
76413791a03f8f Sakari Ailus     2016-02-21  415   * the users count of the =
node. For entities corresponding to subdevs the
76413791a03f8f Sakari Ailus     2016-02-21  416   * use_count field stores =
the total number of users of all video device nodes
76413791a03f8f Sakari Ailus     2016-02-21  417   * in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  418   *
8fd390b89cc8ca Ezequiel Garcia  2020-01-24  419   * The v4l2_pipeline_pm_{g=
et, put}() functions must be called in the open() and
76413791a03f8f Sakari Ailus     2016-02-21  420   * close() handlers of vid=
eo device nodes. It increments or decrements the use
76413791a03f8f Sakari Ailus     2016-02-21  421   * count of all subdev ent=
ities in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  422   *
76413791a03f8f Sakari Ailus     2016-02-21  423   * To react to link manage=
ment on powered pipelines, the link setup notification
76413791a03f8f Sakari Ailus     2016-02-21  424   * callback updates the us=
e count of all entities in the source and sink sides
76413791a03f8f Sakari Ailus     2016-02-21  425   * of the link.
76413791a03f8f Sakari Ailus     2016-02-21  426   */
76413791a03f8f Sakari Ailus     2016-02-21  427  =

76413791a03f8f Sakari Ailus     2016-02-21  428  /*
76413791a03f8f Sakari Ailus     2016-02-21  429   * pipeline_pm_use_count -=
 Count the number of users of a pipeline
76413791a03f8f Sakari Ailus     2016-02-21  430   * @entity: The entity
76413791a03f8f Sakari Ailus     2016-02-21  431   *
76413791a03f8f Sakari Ailus     2016-02-21  432   * Return the total number=
 of users of all video device nodes in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  433   */
91c71f14b406b0 Li Wei           2018-01-17  434  static int pipeline_pm_use=
_count(struct media_pad *pad,
20b852273642f4 Sakari Ailus     2016-11-21  435  	struct media_graph *graph)
76413791a03f8f Sakari Ailus     2016-02-21  436  {
91c71f14b406b0 Li Wei           2018-01-17 @437  	struct media_entity *enti=
ty =3D pad->entity;
76413791a03f8f Sakari Ailus     2016-02-21  438  	int use =3D 0;
76413791a03f8f Sakari Ailus     2016-02-21  439  =

91c71f14b406b0 Li Wei           2018-01-17  440  	media_graph_walk_start(gr=
aph, pad);
76413791a03f8f Sakari Ailus     2016-02-21  441  =

20b852273642f4 Sakari Ailus     2016-11-21  442  	while ((entity =3D media_=
graph_walk_next(graph))) {
45b46879a78567 Laurent Pinchart 2016-02-29  443  		if (is_media_entity_v4l2=
_video_device(entity))
76413791a03f8f Sakari Ailus     2016-02-21  444  			use +=3D entity->use_co=
unt;
76413791a03f8f Sakari Ailus     2016-02-21  445  	}
76413791a03f8f Sakari Ailus     2016-02-21  446  =

76413791a03f8f Sakari Ailus     2016-02-21  447  	return use;
76413791a03f8f Sakari Ailus     2016-02-21  448  }
76413791a03f8f Sakari Ailus     2016-02-21  449  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8241082276540176326==--

