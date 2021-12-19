Content-Type: multipart/mixed; boundary="===============5275629567318241677=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:533 dcn303_stream_encoder_create() error: buffer overflow 'stream_enc_regs' 2 <= 4
Date: Sun, 19 Dec 2021 09:55:16 +0800
Message-ID: <202112190934.db7anVBT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5275629567318241677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Chris Park <Chris.Park@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: cd6d421e3d1ad5926b74091254e345db730e7706 drm/amd/display: Initial D=
C support for Beige Goby
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211219/202112190934.db7anVBT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:533 dcn30=
3_stream_encoder_create() error: buffer overflow 'stream_enc_regs' 2 <=3D 4

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/dcn303_resource.c:531 dcn30=
3_stream_encoder_create() warn: possible memory leak of 'enc1'

vim +/stream_enc_regs +533 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn303/=
dcn303_resource.c

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  510  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  511  static struct stream_encod=
er *dcn303_stream_encoder_create(enum engine_id eng_id, struct dc_context *=
ctx)
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  512  {
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  513  	struct dcn10_stream_encod=
er *enc1;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  514  	struct vpg *vpg;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  515  	struct afmt *afmt;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  516  	int vpg_inst;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  517  	int afmt_inst;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  518  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  519  	/* Mapping of VPG, AFMT, =
DME register blocks to DIO block instance */
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  520  	if (eng_id <=3D ENGINE_ID=
_DIGE) {
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  521  		vpg_inst =3D eng_id;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  522  		afmt_inst =3D eng_id;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  523  	} else
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  524  		return NULL;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  525  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  526  	enc1 =3D kzalloc(sizeof(s=
truct dcn10_stream_encoder), GFP_KERNEL);
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  527  	vpg =3D dcn303_vpg_create=
(ctx, vpg_inst);
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  528  	afmt =3D dcn303_afmt_crea=
te(ctx, afmt_inst);
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  529  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  530  	if (!enc1 || !vpg || !afm=
t)
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  531  		return NULL;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  532  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15 @533  	dcn30_dio_stream_encoder_=
construct(enc1, ctx, ctx->dc_bios, eng_id, vpg, afmt, &stream_enc_regs[eng_=
id],
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  534  			&se_shift, &se_mask);
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  535  =

cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  536  	return &enc1->base;
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  537  }
cd6d421e3d1ad5 Aurabindo Pillai 2021-03-15  538  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5275629567318241677==--

