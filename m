Content-Type: multipart/mixed; boundary="===============8224809484627770628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tiny/cirrus.c:307:9: sparse: got void COPYING CREDITS Documentation Kbuild Kconfig LICENSES MAINTAINERS Makefile README arch block certs crypto drivers fs include init ipc kernel lib mm net samples scripts security sound tools usr virt
Date: Tue, 04 Aug 2020 21:12:16 +0800
Message-ID: <202008042114.JisnIVWX%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8224809484627770628==
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
head:   c0842fbc1b18c7a044e6ff3e8fa78bfa822c7d1a
commit: b0548a245dd30bf448e2d4fc88edcb66d4fa668f drm/cirrus: Move to drm/ti=
ny
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-s031-20200804 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-117-g8c7aee71-dirty
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
git remote update linus
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

--===============8224809484627770628==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8224809484627770628==--

