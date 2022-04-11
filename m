Content-Type: multipart/mixed; boundary="===============0042553004823457361=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm: mxsfb: Implement LCDIF scanout CRC32 support
Date: Mon, 11 Apr 2022 10:55:10 +0800
Message-ID: <202204111055.ETeht46W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0042553004823457361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220409231040.344801-1-marex@denx.de>
References: <20220409231040.344801-1-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: dri-devel(a)lists.freedesktop.org
CC: Marek Vasut <marex@denx.de>
CC: Peng Fan <peng.fan@nxp.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: robert.foss(a)linaro.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Robby Cai <robby.cai@nxp.com>
CC: Sam Ravnborg <sam@ravnborg.org>

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-=
next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc1 next-20220408]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-mxsf=
b-Implement-LCDIF-scanout-CRC32-support/20220410-071222
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220411/202204111055.ETeht46W-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mxsfb/mxsfb_kms.c:444 mxsfb_crtc_set_crc_source() warn: var=
iable dereferenced before check 'crtc' (see line 442)

vim +/crtc +444 drivers/gpu/drm/mxsfb/mxsfb_kms.c

ae1ed009328193 Laurent Pinchart 2020-07-27  439  =

5797982b2ba894 Marek Vasut      2022-04-10  440  static int mxsfb_crtc_set_=
crc_source(struct drm_crtc *crtc, const char *source)
5797982b2ba894 Marek Vasut      2022-04-10  441  {
5797982b2ba894 Marek Vasut      2022-04-10 @442  	struct mxsfb_drm_private =
*mxsfb =3D to_mxsfb_drm_private(crtc->dev);
5797982b2ba894 Marek Vasut      2022-04-10  443  =

5797982b2ba894 Marek Vasut      2022-04-10 @444  	if (!crtc)
5797982b2ba894 Marek Vasut      2022-04-10  445  		return -ENODEV;
5797982b2ba894 Marek Vasut      2022-04-10  446  =

5797982b2ba894 Marek Vasut      2022-04-10  447  	if (source && strcmp(sour=
ce, "auto") =3D=3D 0)
5797982b2ba894 Marek Vasut      2022-04-10  448  		mxsfb->crc_active =3D tr=
ue;
5797982b2ba894 Marek Vasut      2022-04-10  449  	else if (!source)
5797982b2ba894 Marek Vasut      2022-04-10  450  		mxsfb->crc_active =3D fa=
lse;
5797982b2ba894 Marek Vasut      2022-04-10  451  	else
5797982b2ba894 Marek Vasut      2022-04-10  452  		return -EINVAL;
5797982b2ba894 Marek Vasut      2022-04-10  453  =

5797982b2ba894 Marek Vasut      2022-04-10  454  	return 0;
5797982b2ba894 Marek Vasut      2022-04-10  455  }
5797982b2ba894 Marek Vasut      2022-04-10  456  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0042553004823457361==--

