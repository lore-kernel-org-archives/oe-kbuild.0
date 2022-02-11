Content-Type: multipart/mixed; boundary="===============0645740572244670431=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 10626/20393] drivers/media/v4l2-core/v4l2-mc.c:437:23: warning: Value stored to 'entity' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 12 Feb 2022 01:58:56 +0800
Message-ID: <202202112350.OcfB6Wi1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0645740572244670431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Li Wei <wei.l.li@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>
CC: Chen Meng J <meng.j.chen@intel.com>
CC: Meng Wei <wei.meng@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   2dafc777a64181d42982628c7f5907a03da5f070
commit: 91c71f14b406b0fe0f72f7e75e6a85e344b1927a [10626/20393] media: v4l2-=
mc: fix entity use_count issue for dual sensors
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
211/202202112350.OcfB6Wi1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/91c71f14b406b0fe0=
f72f7e75e6a85e344b1927a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 91c71f14b406b0fe0f72f7e75e6a85e344b1927a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
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
   2 warnings generated.
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
   drivers/gpu/drm/drm_mode_config.c:443:4: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mode_config.c:443:4: note: Value stored to 'ret' is =
never read
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/spmi/spmi.c:553:2: warning: Value stored to 'dummy' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           dummy =3D device_for_each_child(&ctrl->dev, NULL,
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spmi/spmi.c:553:2: note: Value stored to 'dummy' is never read
           dummy =3D device_for_each_child(&ctrl->dev, NULL,
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/drm_crtc_helper.c:635:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:635:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: warning: Value stored to 'count=
' is never read [clang-analyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   drivers/gpu/drm/drm_crtc_helper.c:681:2: note: Value stored to 'count' i=
s never read
           count =3D 0;
           ^       ~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/decnet/af_decnet.c:1765:4: warning: Value stored to 'rv' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           rv =3D -EFAULT;
                           ^    ~~~~~~~
   net/decnet/af_decnet.c:1765:4: note: Value stored to 'rv' is never read
                           rv =3D -EFAULT;
                           ^    ~~~~~~~
   net/decnet/af_decnet.c:1962:2: warning: Value stored to 'mss' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           mss =3D scp->segsize_rem;
           ^     ~~~~~~~~~~~~~~~~
   net/decnet/af_decnet.c:1962:2: note: Value stored to 'mss' is never read
           mss =3D scp->segsize_rem;
           ^     ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/decnet/dn_nsp_in.c:763:3: warning: Value stored to 'ptr' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D 2;
                   ^      ~
   net/decnet/dn_nsp_in.c:763:3: note: Value stored to 'ptr' is never read
                   ptr +=3D 2;
                   ^      ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   2 warnings generated.
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/unix/af_unix.c:1504:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   net/unix/af_unix.c:1504:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
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
   2 warnings generated.
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
   2 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   sound/drivers/opl3/opl3_lib.c:490:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(hw->name, hw->id);
           ^~~~~~
   sound/drivers/opl3/opl3_lib.c:490:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(hw->name, hw->id);

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
--===============0645740572244670431==--

