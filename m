Content-Type: multipart/mixed; boundary="===============1883978702801787126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/i915/dp: Expose connector VRR monitor range via debugfs
Date: Mon, 15 Jun 2020 00:44:19 +0800
Message-ID: <202006150032.ai4xStCW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1883978702801787126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200612230444.10121-4-manasi.d.navare@intel.com>
References: <20200612230444.10121-4-manasi.d.navare@intel.com>
TO: Manasi Navare <manasi.d.navare@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
TO: dri-devel(a)lists.freedesktop.org
CC: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Hi Manasi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next linu=
s/master next-20200613]
[cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Manasi-Navare/VRR-capable-=
attach-prop-in-i915-DPCD-helper-VRR-debugfs/20200613-070517
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: In=
valid number of character '{' when no macros are defined. [syntaxError]
   =

   ^
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: In=
valid number of character '{' when these macros are defined: 'CONFIG_DEBUG_=
FS'. [syntaxError]
   =

   ^
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: In=
valid number of character '{' when these macros are defined: 'CONFIG_DRM_FB=
DEV_EMULATION'. [syntaxError]
   =

   ^

# https://github.com/0day-ci/linux/commit/670af3cf7a3a36bb87776fbfd7f913cd3=
3681bbc
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 670af3cf7a3a36bb87776fbfd7f913cd33681bbc
vim +2258 drivers/gpu/drm/i915/display/intel_display_debugfs.c

670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2202  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2203  /**
926b005cd8c4e3 Jani Nikula        2020-02-11  2204   * intel_connector_debu=
gfs_add - add i915 specific connector debugfs files
926b005cd8c4e3 Jani Nikula        2020-02-11  2205   * @connector: pointer =
to a registered drm_connector
926b005cd8c4e3 Jani Nikula        2020-02-11  2206   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2207   * Cleanup will be done=
 by drm_connector_unregister() through a call to
926b005cd8c4e3 Jani Nikula        2020-02-11  2208   * drm_debugfs_connecto=
r_remove().
926b005cd8c4e3 Jani Nikula        2020-02-11  2209   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2210   * Returns 0 on success=
, negative error codes on error.
926b005cd8c4e3 Jani Nikula        2020-02-11  2211   */
926b005cd8c4e3 Jani Nikula        2020-02-11  2212  int intel_connector_deb=
ugfs_add(struct drm_connector *connector)
926b005cd8c4e3 Jani Nikula        2020-02-11  2213  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2214  	struct dentry *root =
=3D connector->debugfs_entry;
926b005cd8c4e3 Jani Nikula        2020-02-11  2215  	struct drm_i915_privat=
e *dev_priv =3D to_i915(connector->dev);
926b005cd8c4e3 Jani Nikula        2020-02-11  2216  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2217  	/* The connector must =
have been registered beforehands. */
926b005cd8c4e3 Jani Nikula        2020-02-11  2218  	if (!root)
926b005cd8c4e3 Jani Nikula        2020-02-11  2219  		return -ENODEV;
926b005cd8c4e3 Jani Nikula        2020-02-11  2220  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2221  	if (connector->connect=
or_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2222  		debugfs_create_file("=
i915_panel_timings", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2223  				    connector, &i91=
5_panel_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2224  		debugfs_create_file("=
i915_psr_sink_status", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2225  				    connector, &i91=
5_psr_sink_status_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2226  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2227  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2228  	if (connector->connect=
or_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2229  	    connector->connect=
or_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2230  	    connector->connect=
or_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2231  		debugfs_create_file("=
i915_hdcp_sink_capability", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2232  				    connector, &i91=
5_hdcp_sink_capability_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2233  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2234  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2235  	if (INTEL_GEN(dev_priv=
) >=3D 10 &&
926b005cd8c4e3 Jani Nikula        2020-02-11  2236  	    (connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2237  	     connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_eDP))
926b005cd8c4e3 Jani Nikula        2020-02-11  2238  		debugfs_create_file("=
i915_dsc_fec_support", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2239  				    connector, &i91=
5_dsc_fec_support_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2240  =

670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2241  		if (INTEL_GEN(dev_pri=
v) >=3D 12)
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2242  			debugfs_create_file(=
"vrr_range", S_IRUGO,
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2243  					    root, connecto=
r, &vrr_range_fops);
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2244  	}
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2245  =

8806211fe7b306 Anshuman Gupta     2020-04-15  2246  	/* Legacy panels doesn=
't lpsp on any platform */
8806211fe7b306 Anshuman Gupta     2020-04-15  2247  	if ((INTEL_GEN(dev_pri=
v) >=3D 9 || IS_HASWELL(dev_priv) ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2248  	     IS_BROADWELL(dev_=
priv)) &&
8806211fe7b306 Anshuman Gupta     2020-04-15  2249  	     (connector->conne=
ctor_type =3D=3D DRM_MODE_CONNECTOR_DSI ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2250  	     connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_eDP ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2251  	     connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2252  	     connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2253  	     connector->connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
8806211fe7b306 Anshuman Gupta     2020-04-15  2254  		debugfs_create_file("=
i915_lpsp_capability", 0444, root,
8806211fe7b306 Anshuman Gupta     2020-04-15  2255  				    connector, &i91=
5_lpsp_capability_fops);
8806211fe7b306 Anshuman Gupta     2020-04-15  2256  =

926b005cd8c4e3 Jani Nikula        2020-02-11  2257  	return 0;
926b005cd8c4e3 Jani Nikula        2020-02-11 @2258  }

:::::: The code at line 2258 was first introduced by commit
:::::: 926b005cd8c4e325ab918edea0fbdd1d25d1ba28 drm/i915: split out display=
 debugfs to a separate file

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1883978702801787126==--

