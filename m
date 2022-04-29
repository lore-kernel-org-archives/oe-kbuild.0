Content-Type: multipart/mixed; boundary="===============2103228405009901320=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5845/7959] drivers/gpu/drm/display/drm_dp_aux_dev.c:251:76: warning: Parameter 'aux' can be declared with const [constParameter]
Date: Fri, 29 Apr 2022 22:38:10 +0800
Message-ID: <202204292210.hgS9bJwV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2103228405009901320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: da68386d9edb1f57abf886febe5c5169ebd4d2c9 [5845/7959] drm: Rename dp=
/ to display/
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout da68386d9edb1f57abf886febe5c5169ebd4d2c9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_mipi_dsi.c:307:73: warning: Parameter 'node' can be =
declared with const [constParameter]
   struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *=
node)
                                                                           ^
--
>> drivers/gpu/drm/display/drm_dp_aux_dev.c:251:76: warning: Parameter 'aux=
' can be declared with const [constParameter]
   static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_aux(struct drm_dp_au=
x *aux)
                                                                           =
   ^
>> drivers/gpu/drm/display/drm_dp_aux_dev.c:263:13: warning: Uninitialized =
variable: iter->aux [uninitvar]
     if (iter->aux =3D=3D aux) {
               ^
--
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:5128:34: warning: Paramete=
r 'branch' can be declared with const [constParameter]
          struct drm_dp_mst_branch *branch)
                                    ^

vim +/aux +251 drivers/gpu/drm/display/drm_dp_aux_dev.c

e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  250  =

e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21 @251  static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_aux(struct drm=
_dp_aux *aux)
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  252  {
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  253  	struct drm_dp_aux_dev *iter, *aux_dev =3D NULL;
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  254  	int id;
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  255  =

e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  256  	/* don't increase kref count here because this function should on=
ly be
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  257  	 * used by drm_dp_aux_unregister_devnode. Thus, it will always ha=
ve at
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  258  	 * least one reference - the one that drm_dp_aux_register_devnode
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  259  	 * created
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  260  	 */
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  261  	mutex_lock(&aux_idr_mutex);
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  262  	idr_for_each_entry(&aux_idr, iter, id) {
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21 @263  		if (iter->aux =3D=3D aux) {
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  264  			aux_dev =3D iter;
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  265  			break;
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  266  		}
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  267  	}
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  268  	mutex_unlock(&aux_idr_mutex);
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  269  	return aux_dev;
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  270  }
e94cb37b34eb8a8 drivers/gpu/drm/drm_dp_aux_dev.c Rafael Antognolli 2016-01-=
21  271  =


:::::: The code at line 251 was first introduced by commit
:::::: e94cb37b34eb8a88fe847438dba55c3f18bf024a drm/dp: Add a drm_aux-dev m=
odule for reading/writing dpcd registers.

:::::: TO: Rafael Antognolli <rafael.antognolli@intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2103228405009901320==--

