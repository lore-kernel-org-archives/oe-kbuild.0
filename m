Content-Type: multipart/mixed; boundary="===============9008717944669657854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tiny/cirrus.c:307:9: sparse: got void COPYING CREDITS Documentation Kbuild Kconfig LICENSES MAINTAINERS Makefile README arch block certs crypto drivers fs include init ipc kernel lib mm net samples scripts security sound tools usr virt
Date: Sat, 12 Sep 2020 17:23:15 +0800
Message-ID: <202009121711.CJbMmrRl%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9008717944669657854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Daniel,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   729e3d091984487f7aa1ebfabfe594e5b317ed0f
commit: b0548a245dd30bf448e2d4fc88edcb66d4fa668f drm/cirrus: Move to drm/ti=
ny
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-s032-20200912 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout b0548a245dd30bf448e2d4fc88edcb66d4fa668f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/tiny/cirrus.c:307:9: sparse: sparse: cast removes addres=
s space '<asn:2>' of expression
   drivers/gpu/drm/tiny/cirrus.c:307:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/tiny/cirrus.c:307:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
>> drivers/gpu/drm/tiny/cirrus.c:307:9: sparse:     got void *

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db0548a245dd30bf448e2d4fc88edcb66d4fa668f
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout b0548a245dd30bf448e2d4fc88edcb66d4fa668f
vim +307 drivers/gpu/drm/tiny/cirrus.c

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
1  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
2  static int cirrus_mode_set(struct cirrus_device *cirrus,
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
3  			   struct drm_display_mode *mode,
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
4  			   struct drm_framebuffer *fb)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
5  {
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
6  	int hsyncstart, hsyncend, htotal, hdispend;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
7  	int vtotal, vdispend;
81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  18=
8  	int tmp, idx;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  18=
9  	int sr07 =3D 0, hdr =3D 0;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
0  =

81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  19=
1  	if (!drm_dev_enter(&cirrus->dev, &idx))
81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  19=
2  		return -1;
81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  19=
3  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
4  	htotal =3D mode->htotal / 8;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
5  	hsyncend =3D mode->hsync_end / 8;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
6  	hsyncstart =3D mode->hsync_start / 8;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
7  	hdispend =3D mode->hdisplay / 8;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
8  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  19=
9  	vtotal =3D mode->vtotal;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
0  	vdispend =3D mode->vdisplay;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
1  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
2  	vdispend -=3D 1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
3  	vtotal -=3D 2;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
4  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
5  	htotal -=3D 5;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
6  	hdispend -=3D 1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
7  	hsyncstart +=3D 1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
8  	hsyncend +=3D 1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  20=
9  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
0  	wreg_crt(cirrus, VGA_CRTC_V_SYNC_END, 0x20);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
1  	wreg_crt(cirrus, VGA_CRTC_H_TOTAL, htotal);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
2  	wreg_crt(cirrus, VGA_CRTC_H_DISP, hdispend);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
3  	wreg_crt(cirrus, VGA_CRTC_H_SYNC_START, hsyncstart);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
4  	wreg_crt(cirrus, VGA_CRTC_H_SYNC_END, hsyncend);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
5  	wreg_crt(cirrus, VGA_CRTC_V_TOTAL, vtotal & 0xff);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
6  	wreg_crt(cirrus, VGA_CRTC_V_DISP_END, vdispend & 0xff);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
7  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
8  	tmp =3D 0x40;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  21=
9  	if ((vdispend + 1) & 512)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
0  		tmp |=3D 0x20;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
1  	wreg_crt(cirrus, VGA_CRTC_MAX_SCAN, tmp);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
2  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
3  	/*
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
4  	 * Overflow bits for values that don't fit in the standard registers
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
5  	 */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
6  	tmp =3D 0x10;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
7  	if (vtotal & 0x100)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
8  		tmp |=3D 0x01;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  22=
9  	if (vdispend & 0x100)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
0  		tmp |=3D 0x02;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
1  	if ((vdispend + 1) & 0x100)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
2  		tmp |=3D 0x08;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
3  	if (vtotal & 0x200)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
4  		tmp |=3D 0x20;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
5  	if (vdispend & 0x200)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
6  		tmp |=3D 0x40;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
7  	wreg_crt(cirrus, VGA_CRTC_OVERFLOW, tmp);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
8  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  23=
9  	tmp =3D 0;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
0  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
1  	/* More overflow bits */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
2  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
3  	if ((htotal + 5) & 0x40)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
4  		tmp |=3D 0x10;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
5  	if ((htotal + 5) & 0x80)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
6  		tmp |=3D 0x20;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
7  	if (vtotal & 0x100)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
8  		tmp |=3D 0x40;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  24=
9  	if (vtotal & 0x200)
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
0  		tmp |=3D 0x80;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
1  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
2  	wreg_crt(cirrus, CL_CRT1A, tmp);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
3  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
4  	/* Disable Hercules/CGA compatibility */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
5  	wreg_crt(cirrus, VGA_CRTC_MODE, 0x03);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
6  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
7  	sr07 =3D rreg_seq(cirrus, 0x07);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
8  	sr07 &=3D 0xe0;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  25=
9  	hdr =3D 0;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
0  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
1  	cirrus->cpp =3D cirrus_cpp(fb);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
2  	switch (cirrus->cpp * 8) {
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
3  	case 8:
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
4  		sr07 |=3D 0x11;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
5  		break;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
6  	case 16:
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
7  		sr07 |=3D 0x17;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
8  		hdr =3D 0xc1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  26=
9  		break;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
0  	case 24:
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
1  		sr07 |=3D 0x15;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
2  		hdr =3D 0xc5;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
3  		break;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
4  	case 32:
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
5  		sr07 |=3D 0x19;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
6  		hdr =3D 0xc5;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
7  		break;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  27=
8  	default:
81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  27=
9  		drm_dev_exit(idx);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
0  		return -1;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
1  	}
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
2  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
3  	wreg_seq(cirrus, 0x7, sr07);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
4  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
5  	/* Program the pitch */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
6  	cirrus->pitch =3D cirrus_pitch(fb);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
7  	tmp =3D cirrus->pitch / 8;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
8  	wreg_crt(cirrus, VGA_CRTC_OFFSET, tmp);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  28=
9  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
0  	/* Enable extended blanking and pitch bits, and enable full memory */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
1  	tmp =3D 0x22;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
2  	tmp |=3D (cirrus->pitch >> 7) & 0x10;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
3  	tmp |=3D (cirrus->pitch >> 6) & 0x40;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
4  	wreg_crt(cirrus, 0x1b, tmp);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
5  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
6  	/* Enable high-colour modes */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
7  	wreg_gfx(cirrus, VGA_GFX_MODE, 0x40);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
8  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  29=
9  	/* And set graphics mode */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
0  	wreg_gfx(cirrus, VGA_GFX_MISC, 0x01);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
1  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
2  	wreg_hdr(cirrus, hdr);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
3  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
4  	cirrus_set_start_address(cirrus, 0);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
5  =

ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  30=
6  	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05 @30=
7  	outb(0x20, 0x3c0);
81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  30=
8  =

81e7301d7da3b7 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2020-02-11  30=
9  	drm_dev_exit(idx);
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  31=
0  	return 0;
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  31=
1  }
ab3e023b1b4c98 drivers/gpu/drm/cirrus/cirrus.c Gerd Hoffmann 2019-04-05  31=
2  =


:::::: The code at line 307 was first introduced by commit
:::::: ab3e023b1b4c9887c9f0f761b47f3f0516bd3434 drm/cirrus: rewrite and mod=
ernize driver.

:::::: TO: Gerd Hoffmann <kraxel@redhat.com>
:::::: CC: Gerd Hoffmann <kraxel@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9008717944669657854==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
pdcBAA==
--===============9008717944669657854==--

