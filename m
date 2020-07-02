Content-Type: multipart/mixed; boundary="===============4288984496719184595=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/i915: Send hotplug event if edid had changed
Date: Thu, 02 Jul 2020 16:51:15 +0800
Message-ID: <202007021649.xKyX4Zf6%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4288984496719184595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200630002700.5451-4-kunal1.joshi@intel.com>
References: <20200630002700.5451-4-kunal1.joshi@intel.com>
TO: Kunal Joshi <kunal1.joshi@intel.com>

Hi Kunal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v5.8-rc3]
[cannot apply to drm-intel/for-linux-next next-20200701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kunal-Joshi/Send-a-hotplug=
-when-edid-changes/20200630-152626
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/i915/display/intel_hotplug.c:286:6: warning: Variable 'o=
ld_epoch_counter' is not assigned a value. [unassignedVariable]
    u64 old_epoch_counter;
        ^
>> drivers/gpu/drm/i915/display/intel_hotplug.c:295:6: warning: Uninitializ=
ed variable: old_epoch_counter [uninitvar]
    if (old_epoch_counter !=3D connector->base.epoch_counter)
        ^

# https://github.com/0day-ci/linux/commit/52973bbb22573f4d170806d2ade0a8871=
be92d89
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 52973bbb22573f4d170806d2ade0a8871be92d89
vim +/old_epoch_counter +286 drivers/gpu/drm/i915/display/intel_hotplug.c

77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  279  =

3944709df8e9298 drivers/gpu/drm/i915/display/intel_hotplug.c Imre Deak     =
      2019-07-11  280  enum intel_hotplug_state
3944709df8e9298 drivers/gpu/drm/i915/display/intel_hotplug.c Imre Deak     =
      2019-07-11  281  intel_encoder_hotplug(struct intel_encoder *encoder,
8c8919c7c99f097 drivers/gpu/drm/i915/display/intel_hotplug.c Imre Deak     =
      2020-03-30  282  		      struct intel_connector *connector)
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  283  {
dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  284  	struct drm_device *dev =3D connector->ba=
se.dev;
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  285  	enum drm_connector_status old_status;
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30 @286  	u64 old_epoch_counter;
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  287  	bool ret =3D false;
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  288  =

f4224a4cb16c248 drivers/gpu/drm/i915/display/intel_hotplug.c Pankaj Bharadi=
ya    2020-01-28  289  	drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config=
.mutex));
dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  290  	old_status =3D connector->base.status;
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  291  =

dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  292  	connector->base.status =3D
dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  293  		drm_helper_probe_detect(&connector->bas=
e, NULL, false);
6c5ed5ae353cdf1 drivers/gpu/drm/i915/intel_hotplug.c         Maarten Lankho=
rst   2017-04-06  294  =

52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30 @295  	if (old_epoch_counter !=3D connector->base.epoch_co=
unter)
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  296  		ret =3D true;
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  297  =

52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  298  	if (ret) {
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  299  		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated fr=
om %s to %s(epoch counter %llu)\n",
dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  300  			      connector->base.base.id,
dba14b27dd3ca5c drivers/gpu/drm/i915/intel_hotplug.c         Ville Syrj=C3=
=A4l=C3=A4       2018-01-17  301  			      connector->base.name,
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  302  			      drm_get_connector_status_name(old_status),
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  303  			      drm_get_connector_status_name(connector->ba=
se.status),
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  304  			      connector->base.epoch_counter);
3944709df8e9298 drivers/gpu/drm/i915/display/intel_hotplug.c Imre Deak     =
      2019-07-11  305  		return INTEL_HOTPLUG_CHANGED;
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  306  	}
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  307  	return INTEL_HOTPLUG_UNCHANGED;
52973bbb22573f4 drivers/gpu/drm/i915/display/intel_hotplug.c Stanislav Liso=
vskiy 2020-06-30  308  }
77913b39addfaa8 drivers/gpu/drm/i915/intel_hotplug.c         Jani Nikula   =
      2015-06-18  309  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4288984496719184595==--

