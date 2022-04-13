Content-Type: multipart/mixed; boundary="===============4810755096353366504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jani-drm:edid-hfeeodb 51/63] drivers/gpu/drm/drm_edid.c:5158 drm_edid_get_monitor_name() error: we previously assumed 'name' could be null (see line 5147)
Date: Thu, 14 Apr 2022 00:25:17 +0800
Message-ID: <202204140053.lDp3iKrQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4810755096353366504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jani Nikula <jani.nikula@intel.com>

tree:   git://people.freedesktop.org/~jani/drm edid-hfeeodb
head:   06dad405a39456891fce7cc9e26d45177d56edc1
commit: 59d0e7c2f8dff534ac72b7a2baea89dc23c61d66 [51/63] drm/edid: convert =
get_monitor_name() to drm_edid
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
414/202204140053.lDp3iKrQ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_edid.c:5158 drm_edid_get_monitor_name() error: we previ=
ously assumed 'name' could be null (see line 5147)

vim +/name +5158 drivers/gpu/drm/drm_edid.c

59f7c0fa325e56 Jim Bride   2016-04-14  5132  =

59f7c0fa325e56 Jim Bride   2016-04-14  5133  /**
59f7c0fa325e56 Jim Bride   2016-04-14  5134   * drm_edid_get_monitor_name -=
 fetch the monitor name from the edid
59f7c0fa325e56 Jim Bride   2016-04-14  5135   * @edid: monitor EDID informa=
tion
59f7c0fa325e56 Jim Bride   2016-04-14  5136   * @name: pointer to a charact=
er array to hold the name of the monitor
59f7c0fa325e56 Jim Bride   2016-04-14  5137   * @bufsize: The size of the n=
ame buffer (should be at least 14 chars.)
59f7c0fa325e56 Jim Bride   2016-04-14  5138   *
59f7c0fa325e56 Jim Bride   2016-04-14  5139   */
f4e558ec9d9fb9 Jani Nikula 2022-03-28  5140  void drm_edid_get_monitor_name=
(const struct edid *edid, char *name, int bufsize)
59f7c0fa325e56 Jim Bride   2016-04-14  5141  {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5142  	int name_length =3D 0;
59f7c0fa325e56 Jim Bride   2016-04-14  5143  =

59f7c0fa325e56 Jim Bride   2016-04-14  5144  	if (bufsize <=3D 0)
59f7c0fa325e56 Jim Bride   2016-04-14  5145  		return;
59f7c0fa325e56 Jim Bride   2016-04-14  5146  =

59d0e7c2f8dff5 Jani Nikula 2022-04-12 @5147  	if (edid && name) {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5148  		char buf[13];
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5149  		struct drm_edid drm_edid =3D=
 {
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5150  			.edid =3D edid,
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5151  			.size =3D edid_size(edid),
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5152  		};
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5153  =

59d0e7c2f8dff5 Jani Nikula 2022-04-12  5154  		name_length =3D min(get_moni=
tor_name(&drm_edid, buf), bufsize - 1);
59f7c0fa325e56 Jim Bride   2016-04-14  5155  		memcpy(name, buf, name_lengt=
h);
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5156  	}
59d0e7c2f8dff5 Jani Nikula 2022-04-12  5157  =

59f7c0fa325e56 Jim Bride   2016-04-14 @5158  	name[name_length] =3D '\0';
59f7c0fa325e56 Jim Bride   2016-04-14  5159  }
59f7c0fa325e56 Jim Bride   2016-04-14  5160  EXPORT_SYMBOL(drm_edid_get_mon=
itor_name);
59f7c0fa325e56 Jim Bride   2016-04-14  5161  =


:::::: The code@line 5158 was first introduced by commit
:::::: 59f7c0fa325e5661188a174a435ea4925543985b drm/edid: Add drm_edid_get_=
monitor_name()

:::::: TO: Jim Bride <jim.bride@linux.intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4810755096353366504==--

