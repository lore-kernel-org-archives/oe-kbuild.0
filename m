Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CEB2F066A
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630143; cv=none; b=DJQWPaLN84YT27qOMQgnacs9mero2N/bZIJreSMbDIFKVxKaVRRlL5eHMa5dStwa3IYiSgq8cITMrUvclisYaYtOSnmlkloObUhLPlIO615xGGod27csbDjGJPOUWygkVmNrG3QgL4sN2/QP3ROJg58s9i4fVBAs+HWUFmVgvHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630143; c=relaxed/simple;
	bh=hXw8aRtWxSxxJZtyxXEoZDVFFI0fkR/fHDNimI5PTE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PY+52+zF+2Di55y6eGv/UrAP4poTOlJNppi42RHbSZUcKJqwWh3R7AoUaSrO+N/pF1tGidK5i8YEyvrYmpGhsN//ZfJYrRj2zo5gMwvIJOi/cwonxL+/XDRXN15Oa/gtuViDlgfoPvo3AZQwsHm4QuGgB+0WQfi5JGDzzaB0TSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+fjnKKV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+fjnKKV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ed7024c8c5so4481811cf.3
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 01:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763630133; x=1764234933; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=410FVRhxtZ57j3BPflhu4c4eU/TN0n8PAxwLsqZ85FE=;
        b=f+fjnKKVCGtkjLBUGapFdB5FN4fpVbHk2nh0UniB14vKMXvTt8gZIT2UNte7xsaV9c
         6e07z8wJOZRj5Qu+kdL2K7OWa3jgKv3PvOVk+ilerLtSejZWFHqi5SHL42z8Bx237FdS
         m6i0q5JWbNuaXLtD7wEIRbp3sxehMa3dYlonXrczHskGQfQlXzIs7ziITW8W15UMYGu0
         H7hn8rndXK/Tx5R52ujxzb88OtTxgYREBB41dIbmEedLvauMaEF6EdFUCLEEyV4i1f+q
         zZF8D6DWOjkp1b6wF1DreFNEHaMYlAGHy/bk4+xy53zlSrufIa9Kf3EGvMcv6J3j2vWp
         iD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630133; x=1764234933;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=410FVRhxtZ57j3BPflhu4c4eU/TN0n8PAxwLsqZ85FE=;
        b=WZ4u3ZZhtKK7Wq6goqpxMqydwvcVCLeW5OpVKJLRlh/Eh2A1YbCY4luYnkQxRQ8bxd
         g44hR7rdk5j3Gb9IgjpHj7FFSLHUvayo3Cmk7p1YRRvacmexJWGi51QERUmmOERwOAA2
         rqWhO6XUU30OxL7k/Ha7RjfCDU8KowZ+UpWuZoU/hyYw1J4HO45RD/U3dCB41J1ONm30
         dAdClNjX0BPktgTsO0xCPALZKIjUYn3TGmpwDy8tVbehkE9Mk4iU+Jq64ZPINAJwI+/5
         sQMNtaL/D3FMIyHkMMNFtTtP6pzv1148bvUuou5oeys01HZIQaZkdWZmpiJF2rwSjRxy
         fmwA==
X-Gm-Message-State: AOJu0YwXhRi7Ct43OHkg31lPFwCqOQMvkWY7VmZ/8aXv2p2OZut5/HFm
	Tl/z6IJU0dVpG34O7X6M8PShPOdbY5a0XSljbdpXnA0EfykH17tM1Oq9v33S1AdLn++HpY3EEsh
	WUPvV7soCaqfxWcmvI/5JsmOTVAZQ7km+gITb
X-Gm-Gg: ASbGnctXmgquCnkOyTj6FAii9cb2FOO2XASeTYZkidZ9bN1ccIRRgBuhDaAtPMFKnQS
	qemYwblEAruWK5KCWpIXZmI5hg7lSM7qHAlp5ZT/Hfbr9RLU4gx+2ea/ASrNZWt0uQiFWSfwNAq
	sRFUiMKivwF3tKeShn+x0i9yFZqGzHY12XOCvpKE21hQeNy62iKwEoe75Pu1K6tZUHEDxLjvnFp
	leTQ/cfsFbask5KDboOrQ/ILxJnjSl89rap63jvMnN1EAr57Px4qwrV+dEa5OXkSXOOEuIrwdsC
	vp3h5TI68T0DjEuWYC3Aaea3VdTrD35MWcygyTeQTAkJPjnsXEY8mXxIJKbHLbBjOId44sxgEAm
	ge557cSY+oFErEGTXsEo0OdjRGkGvJx5j4WollVF+C6OqP/u+DthmFFhfn8+98EAYlj8U49ODOx
	16ViU7NSWL
X-Google-Smtp-Source: AGHT+IEjosGIIXEb9EKpHNbVMYN4R0ClQK2YMJCXrG9sywrmNTgRdPlxdQFVzX1+lNUt89wk3W+q4l4s7BKi+Xz2eok=
X-Received: by 2002:a05:622a:1a88:b0:4ed:62f5:e1fc with SMTP id
 d75a77b69052e-4ee4a0e59e6mr22941361cf.75.1763630131804; Thu, 20 Nov 2025
 01:15:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511200403.G1aJi4TR-lkp@intel.com> <LV9PR21MB475794F80348E7D666BD9C3EE4D4A@LV9PR21MB4757.namprd21.prod.outlook.com>
In-Reply-To: <LV9PR21MB475794F80348E7D666BD9C3EE4D4A@LV9PR21MB4757.namprd21.prod.outlook.com>
From: Steve French <smfrench@gmail.com>
Date: Thu, 20 Nov 2025 03:15:18 -0600
X-Gm-Features: AWmQ_bmNg3P-zYoPNYGT8FOiANUnQ2cQSH2W5vyZKSF2ixTJA3rLq8V2cBcRdSE
Message-ID: <CAH2r5mtP-0gE+KxrJZwhCQ4+kDtd2OmAG+JEhHwW0PX2U93vAQ@mail.gmail.com>
Subject: Fwd: Fw: [EXTERNAL] [linux-next:master 9911/10183]
 fs/smb/client/fs_context.c:1839 smb3_fs_context_parse_param() warn: variable
 dereferenced before check 'fc' (see line 1123)
To: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>, 
	"Cc: lkp@intel.com" <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: multipart/mixed; boundary="00000000000085995e06440323e7"

--00000000000085995e06440323e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated patch in cifs-2.6.git for-next, also attached

________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Thursday, November 20, 2025 1:16:22 AM
To: oe-kbuild@lists.linux.dev <oe-kbuild@lists.linux.dev>; Shaurya
Rane <ssrane_b23@ee.vjti.ac.in>
Cc: lkp@intel.com <lkp@intel.com>; oe-kbuild-all@lists.linux.dev
<oe-kbuild-all@lists.linux.dev>; Steven French
<Steven.French@microsoft.com>
Subject: [EXTERNAL] [linux-next:master 9911/10183]
fs/smb/client/fs_context.c:1839 smb3_fs_context_parse_param() warn:
variable dereferenced before check 'fc' (see line 1123)

tree:   https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&=
data=3D05%7C02%7CSteven.French%40microsoft.com%7Cbea1e4e83b264d13e23408de28=
04bdd8%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638992198020394607%7CUn=
known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4=
zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DYcrDF8foRllCK7Hr=
58mXTABSkzMlQ9KA4waeOMoYAhQ%3D&reserved=3D0
master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: d3f88ec60fede9bc993071f5f3ea5fb90514efdd [9911/10183] cifs:
fix memory leak in smb3_fs_context_parse_param error path
config: i386-randconfig-141-20251119
(https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdownlo=
ad.01.org%2F0day-ci%2Farchive%2F20251120%2F202511200403.G1aJi4TR-lkp%40inte=
l.com%2Fconfig&data=3D05%7C02%7CSteven.French%40microsoft.com%7Cbea1e4e83b2=
64d13e23408de2804bdd8%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63899219=
8020424866%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw=
MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D8=
FcG%2BTezOhCe7lykTnKFmhuDeCxedEg2NW7j6rpQrjY%3D&reserved=3D0)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flore.kernel.org%2Fr%2F202511200403.G1aJi4TR-lkp%40intel.com%2F&data=3D05=
%7C02%7CSteven.French%40microsoft.com%7Cbea1e4e83b264d13e23408de2804bdd8%7C=
72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638992198020448358%7CUnknown%7CT=
WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO=
IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DzJFjdYlE4cg%2FeVN1yY9f82C=
HlB3xi5Oe78VJMeUkdfg%3D&reserved=3D0

smatch warnings:
fs/smb/client/fs_context.c:1839 smb3_fs_context_parse_param() warn:
variable dereferenced before check 'fc' (see line 1123)

vim +/fc +1839 fs/smb/client/fs_context.c

24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1119  static int smb3_fs_context_parse_param(struct fs_context *fc,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1120                                   struct fs_parameter *param)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  112=
1  {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1122     struct fs_parse_result result;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1123     struct smb3_fs_context *ctx =3D smb3_fc2context(fc);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1124     int i, opt;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1125     bool is_smb3 =3D !strcmp(fc->fs_type->name, "smb3");

                                ^^^^
fc can't be NULL.

24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1126     bool skip_parsing =3D false;
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1127     char *hostname;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  112=
8
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1129     cifs_dbg(FYI, "CIFS: parsing cifs mount option '%s'\n",
param->key);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  113=
0
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1131     /*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1132      * fs_parse can not handle string options with an empty
value so
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1133      * we will need special handling of them.
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1134      */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1135     if (param->type =3D=3D fs_value_is_string && param->string[0] =3D=
=3D
0) {
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1136             if (!strcmp("pass", param->key) ||
!strcmp("password", param->key)) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1137                     skip_parsing =3D true;
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1138                     opt =3D Opt_pass;
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16
 1139             } else if (!strcmp("user", param->key) ||
!strcmp("username", param->key)) {
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16
 1140                     skip_parsing =3D true;
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16
 1141                     opt =3D Opt_user;
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12
 1142             } else if (!strcmp("pass2", param->key) ||
!strcmp("password2", param->key)) {
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12
 1143                     skip_parsing =3D true;
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12
 1144                     opt =3D Opt_pass2;
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1145             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1146     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  114=
7
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1148     if (!skip_parsing) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1149             opt =3D fs_parse(fc, smb3_fs_parameters, param,
&result);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1150             if (opt < 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1151                     return ctx->sloppy ? 1 : opt;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1152     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  115=
3
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1154     switch (opt) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1155     case Opt_compress:
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26
 1156             if (!IS_ENABLED(CONFIG_CIFS_COMPRESSION)) {
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26
 1157                     cifs_errorf(fc, "CONFIG_CIFS_COMPRESSION
kernel config option is unset\n");
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26
 1158                     goto cifs_parse_mount_err;
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26
 1159             }
8fe7062b7d11fc fs/smb/client/fs_context.c Enzo Matsumiya    2024-02-23
 1160             ctx->compress =3D true;
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26
 1161             cifs_dbg(VFS, "SMB3 compression support is
experimental\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1162             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1163     case Opt_nodfs:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1164             ctx->nodfs =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1165             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1166     case Opt_hard:
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1167             if (result.negated) {
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1168                     if (ctx->retry =3D=3D 1)
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1169                             cifs_dbg(VFS, "conflicting hard vs.
soft mount options\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1170                     ctx->retry =3D 0;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1171             } else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1172                     ctx->retry =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1173             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1174     case Opt_soft:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1175             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1176                     ctx->retry =3D 1;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1177             else {
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1178                     if (ctx->retry =3D=3D 1)
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1179                             cifs_dbg(VFS, "conflicting hard vs
soft mount options\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1180                     ctx->retry =3D 0;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11
 1181             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1182             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1183     case Opt_mapposix:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1184             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1185                     ctx->remap =3D false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1186             else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1187                     ctx->remap =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1188                     ctx->sfu_remap =3D false; /* disable SFU
mapping */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1189             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1190             break;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1191     case Opt_mapchars:
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1192             if (result.negated)
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1193                     ctx->sfu_remap =3D false;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1194             else {
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1195                     ctx->sfu_remap =3D true;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1196                     ctx->remap =3D false; /* disable SFM
(mapposix) mapping */
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1197             }
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24
 1198             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1199     case Opt_user_xattr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1200             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1201                     ctx->no_xattr =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1202             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1203                     ctx->no_xattr =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1204             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1205     case Opt_forceuid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1206             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1207                     ctx->override_uid =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1208             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1209                     ctx->override_uid =3D 1;
77d8aa79ecfb20 fs/smb/client/fs_context.c Takayuki Nagata   2024-04-15
 1210             ctx->forceuid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1211             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1212     case Opt_forcegid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1213             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1214                     ctx->override_gid =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1215             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1216                     ctx->override_gid =3D 1;
77d8aa79ecfb20 fs/smb/client/fs_context.c Takayuki Nagata   2024-04-15
 1217             ctx->forcegid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1218             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1219     case Opt_perm:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1220             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1221                     ctx->noperm =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1222             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1223                     ctx->noperm =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1224             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1225     case Opt_dynperm:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1226             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1227                     ctx->dynperm =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1228             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1229                     ctx->dynperm =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1230             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1231     case Opt_sfu:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1232             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1233                     ctx->sfu_emul =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1234             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1235                     ctx->sfu_emul =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1236             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1237     case Opt_noblocksend:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1238             ctx->noblocksnd =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1239             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1240     case Opt_noautotune:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1241             ctx->noautotune =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1242             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1243     case Opt_nolease:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1244             ctx->no_lease =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1245             break;
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23
 1246     case Opt_nosparse:
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23
 1247             ctx->no_sparse =3D 1;
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23
 1248             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1249     case Opt_nodelete:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1250             ctx->nodelete =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1251             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1252     case Opt_multichannel:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1253             if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1254                     ctx->multichannel =3D false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1255                     ctx->max_channels =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1256             } else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1257                     ctx->multichannel =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1258                     /* if number of channels not specified,
default to 2 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1259                     if (ctx->max_channels < 2)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1260                             ctx->max_channels =3D 2;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1261             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1262             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1263     case Opt_uid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27
 1264             ctx->linux_uid =3D result.uid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1265             ctx->uid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1266             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1267     case Opt_cruid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27
 1268             ctx->cred_uid =3D result.uid;
e0a3cbcd5cef00 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-08
 1269             ctx->cruid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1270             break;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28
 1271     case Opt_backupuid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27
 1272             ctx->backupuid =3D result.uid;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28
 1273             ctx->backupuid_specified =3D true;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28
 1274             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1275     case Opt_backupgid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27
 1276             ctx->backupgid =3D result.gid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1277             ctx->backupgid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1278             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1279     case Opt_gid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27
 1280             ctx->linux_gid =3D result.gid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1281             ctx->gid_specified =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1282             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1283     case Opt_port:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1284             ctx->port =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1285             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1286     case Opt_file_mode:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1287             ctx->file_mode =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1288             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1289     case Opt_dirmode:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1290             ctx->dir_mode =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1291             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1292     case Opt_min_enc_offload:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1293             ctx->min_offload =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1294             break;
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17
 1295     case Opt_retrans:
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17
 1296             ctx->retrans =3D result.uint_32;
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17
 1297             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1298     case Opt_blocksize:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1299             /*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1300              * inode blocksize realistically should never need
to be
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1301              * less than 16K or greater than 16M and default is
1MB.
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1302              * Note that small inode block sizes (e.g. 64K) can
lead
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1303              * to very poor performance of common tools like cp
and scp
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1304              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1305             if ((result.uint_32 < CIFS_MAX_MSGSIZE) ||
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1306                (result.uint_32 > (4 * SMB3_DEFAULT_IOSIZE))) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1307                     cifs_errorf(fc, "%s: Invalid blocksize\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1308                             __func__);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1309                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1310             }
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30
 1311             ctx->bsize =3D CIFS_ALIGN_BSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1312             ctx->got_bsize =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1313             break;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1314     case Opt_rasize:
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1315             /*
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1316              * readahead size realistically should never need to
be
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1317              * less than 1M (CIFS_DEFAULT_IOSIZE) or greater
than 32M
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1318              * (perhaps an exception should be considered in the
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1319              * for the case of a large number of channels
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1320              * when multichannel is negotiated) since that would
lead
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1321              * to plenty of parallel I/O in flight to the
server.
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1322              * Note that smaller read ahead sizes would
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1323              * hurt performance of common tools like cp and scp
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1324              * which often trigger sequential i/o with read
ahead
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1325              */
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1326             if ((result.uint_32 > (8 * SMB3_DEFAULT_IOSIZE)) ||
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1327                 (result.uint_32 < CIFS_DEFAULT_IOSIZE)) {
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1328                     cifs_errorf(fc, "%s: Invalid rasize %d vs.
%d\n",
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1329                             __func__, result.uint_32,
SMB3_DEFAULT_IOSIZE);
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1330                     goto cifs_parse_mount_err;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1331             }
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1332             ctx->rasize =3D result.uint_32;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24
 1333             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1334     case Opt_rsize:
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30
 1335             ctx->rsize =3D CIFS_ALIGN_RSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1336             ctx->got_rsize =3D true;
287906b20035a0 fs/smb/client/fs_context.c Wang Zhaolong     2025-03-31
 1337             ctx->vol_rsize =3D ctx->rsize;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1338             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1339     case Opt_wsize:
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30
 1340             ctx->wsize =3D CIFS_ALIGN_WSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14
 1341             ctx->got_wsize =3D true;
287906b20035a0 fs/smb/client/fs_context.c Wang Zhaolong     2025-03-31
 1342             ctx->vol_wsize =3D ctx->wsize;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1343             break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1344     case Opt_acregmax:
7489161b185239 fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1345             if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1346                     cifs_errorf(fc, "acregmax too large\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1347                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1348             }
7489161b185239 fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1349             ctx->acregmax =3D HZ * result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1350             break;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23
 1351     case Opt_acdirmax:
5b29891f91dfb8 fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1352             if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1353                     cifs_errorf(fc, "acdirmax too large\n");
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23
 1354                     goto cifs_parse_mount_err;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23
 1355             }
5b29891f91dfb8 fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1356             ctx->acdirmax =3D HZ * result.uint_32;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23
 1357             break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1358     case Opt_actimeo:
64f690ee22c99e fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1359             if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1360                     cifs_errorf(fc, "timeout too large\n");
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1361                     goto cifs_parse_mount_err;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1362             }
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1363             if ((ctx->acdirmax !=3D CIFS_DEF_ACTIMEO) ||
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1364                 (ctx->acregmax !=3D CIFS_DEF_ACTIMEO)) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1365                     cifs_errorf(fc, "actimeo ignored since
acregmax or acdirmax specified\n");
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1366                     break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1367             }
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1368             ctx->acdirmax =3D ctx->acregmax =3D HZ * result.uint_32;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24
 1369             break;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11
 1370     case Opt_closetimeo:
d5a30fddfe2f2e fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1371             if (result.uint_32 > SMB3_MAX_DCLOSETIMEO / HZ) {
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11
 1372                     cifs_errorf(fc, "closetimeo too large\n");
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11
 1373                     goto cifs_parse_mount_err;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11
 1374             }
d5a30fddfe2f2e fs/smb/client/fs_context.c Murad Masimov     2025-03-11
 1375             ctx->closetimeo =3D HZ * result.uint_32;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11
 1376             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1377     case Opt_echo_interval:
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31
 1378             if (result.uint_32 < SMB_ECHO_INTERVAL_MIN ||
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31
 1379                 result.uint_32 > SMB_ECHO_INTERVAL_MAX) {
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31
 1380                     cifs_errorf(fc, "echo interval is out of
bounds\n");
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31
 1381                     goto cifs_parse_mount_err;
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31
 1382             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1383             ctx->echo_interval =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1384             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1385     case Opt_snapshot:
9405b5f8b20c2b fs/cifs/fs_context.c       Steve French      2022-02-12
 1386             ctx->snapshot_time =3D result.uint_64;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1387             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1388     case Opt_max_credits:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1389             if (result.uint_32 < 20 || result.uint_32 > 60000) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1390                     cifs_errorf(fc, "%s: Invalid max_credits
value\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1391                              __func__);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1392                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1393             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1394             ctx->max_credits =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1395             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1396     case Opt_max_channels:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1397             if (result.uint_32 < 1 || result.uint_32 >
CIFS_MAX_CHANNELS) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1398                     cifs_errorf(fc, "%s: Invalid max_channels
value, needs to be 1-%d\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1399                              __func__, CIFS_MAX_CHANNELS);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1400                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1401             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1402             ctx->max_channels =3D result.uint_32;
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07
 1403             /* If more than one channel requested ... they want
multichan */
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07
 1404             if (result.uint_32 > 1)
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07
 1405                     ctx->multichannel =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1406             break;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1407     case Opt_max_cached_dirs:
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1408             if (result.uint_32 < 1) {
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1409                     cifs_errorf(fc, "%s: Invalid
max_cached_dirs, needs to be 1 or more\n",
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1410                                 __func__);
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1411                     goto cifs_parse_mount_err;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1412             }
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1413             ctx->max_cached_dirs =3D result.uint_32;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01
 1414             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1415     case Opt_handletimeout:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1416             ctx->handle_timeout =3D result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1417             if (ctx->handle_timeout > SMB3_MAX_HANDLE_TIMEOUT) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1418                     cifs_errorf(fc, "Invalid handle cache
timeout, longer than 16 minutes\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1419                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1420             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1421             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1422     case Opt_source:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1423             kfree(ctx->UNC);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1424             ctx->UNC =3D NULL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1425             switch (smb3_parse_devname(param->string, ctx)) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1426             case 0:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1427                     break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1428             case -ENOMEM:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1429                     cifs_errorf(fc, "Unable to allocate memory
for devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1430                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1431             case -EINVAL:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1432                     cifs_errorf(fc, "Malformed UNC in
devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1433                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1434             default:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1435                     cifs_errorf(fc, "Unknown error parsing
devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1436                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1437             }
e8c73eb7db0a49 fs/smb/client/fs_context.c Edward Adam Davis 2025-11-07
 1438             kfree(ctx->source);
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27
 1439             ctx->source =3D smb3_fs_context_fullpath(ctx, '/');
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27
 1440             if (IS_ERR(ctx->source)) {
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27
 1441                     ctx->source =3D NULL;
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1442                     cifs_errorf(fc, "OOM when copying UNC
string\n");
af1a3d2ba9543e fs/cifs/fs_context.c       Ronnie Sahlberg   2021-02-11
 1443                     goto cifs_parse_mount_err;
af1a3d2ba9543e fs/cifs/fs_context.c       Ronnie Sahlberg   2021-02-11
 1444             }
e8c73eb7db0a49 fs/smb/client/fs_context.c Edward Adam Davis 2025-11-07
 1445             kfree(fc->source);
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27
 1446             fc->source =3D kstrdup(ctx->source, GFP_KERNEL);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1447             if (fc->source =3D=3D NULL) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1448                     cifs_errorf(fc, "OOM when copying UNC
string\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1449                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1450             }
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1451             hostname =3D extract_hostname(ctx->UNC);
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1452             if (IS_ERR(hostname)) {
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1453                     cifs_errorf(fc, "Cannot extract hostname
from UNC string\n");
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1454                     goto cifs_parse_mount_err;
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1455             }
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1456             /* last byte, type, is 0x20 for servr type */
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1457             memset(ctx->target_rfc1001_name, 0x20,
RFC1001_NAME_LEN_WITH_NULL);
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1458             for (i =3D 0; i < RFC1001_NAME_LEN && hostname[i] !=3D
0; i++)
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1459                     ctx->target_rfc1001_name[i] =3D
toupper(hostname[i]);
be786e509c1af9 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1460             kfree(hostname);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1461             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1462     case Opt_user:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1463             kfree(ctx->username);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1464             ctx->username =3D NULL;
270d73e6507f9c fs/smb/client/fs_context.c Scott Mayhew      2023-08-16
 1465             if (ctx->nullauth)
270d73e6507f9c fs/smb/client/fs_context.c Scott Mayhew      2023-08-16
 1466                     break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1467             if (strlen(param->string) =3D=3D 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1468                     /* null user, ie. anonymous authentication
*/
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1469                     ctx->nullauth =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1470                     break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1471             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  147=
2
ed6612165b74f0 fs/smb/client/fs_context.c Yiqi Sun          2025-11-11
 1473             if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) =3D=3D
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1474                 CIFS_MAX_USERNAME_LEN) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1475                     pr_warn("username too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1476                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1477             }
e5acab35feffb6 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26
 1478             ctx->username =3D no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1479             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1480     case Opt_pass:
a4e430c8c8ba96 fs/cifs/fs_context.c       Enzo Matsumiya    2022-09-20
 1481             kfree_sensitive(ctx->password);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1482             ctx->password =3D NULL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1483             if (strlen(param->string) =3D=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1484                     break;
524fa5bcc38449 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26
 1485             ctx->password =3D no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1486             break;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1487     case Opt_pass2:
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1488             kfree_sensitive(ctx->password2);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1489             ctx->password2 =3D NULL;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1490             if (strlen(param->string) =3D=3D 0)
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1491                     break;
1b6075ebd34da9 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26
 1492             ctx->password2 =3D no_free_ptr(param->string);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1493             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1494     case Opt_ip:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1495             if (strlen(param->string) =3D=3D 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1496                     ctx->got_ip =3D false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1497                     break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1498             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1499             if (!cifs_convert_address((struct sockaddr
*)&ctx->dstaddr,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1500                                       param->string,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1501                                       strlen(param->string))) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1502                     pr_err("bad ip=3D option (%s)\n",
param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1503                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1504             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1505             ctx->got_ip =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1506             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1507     case Opt_domain:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1508             if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1509                             =3D=3D CIFS_MAX_DOMAINNAME_LEN) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1510                     pr_warn("domain name too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1511                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1512             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  151=
3
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1514             kfree(ctx->domainname);
60c9511253d508 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26
 1515             ctx->domainname =3D no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1516             cifs_dbg(FYI, "Domain name set\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1517             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1518     case Opt_srcaddr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1519             if (!cifs_convert_address(
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1520                             (struct sockaddr *)&ctx->srcaddr,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1521                             param->string,
strlen(param->string))) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1522                     pr_warn("Could not parse srcaddr: %s\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1523                             param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1524                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1525             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1526             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1527     case Opt_iocharset:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1528             if (strnlen(param->string, 1024) >=3D 65) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1529                     pr_warn("iocharset name too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1530                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1531             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  153=
2
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1533             if (strncasecmp(param->string, "default", 7) !=3D 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1534                     kfree(ctx->iocharset);
28f09823de9292 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26
 1535                     ctx->iocharset =3D no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1536             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1537             /* if iocharset not set then load_nls_default
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1538              * is used by caller
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1539              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1540             cifs_dbg(FYI, "iocharset set to %s\n",
ctx->iocharset);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1541             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1542     case Opt_netbiosname:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1543             memset(ctx->source_rfc1001_name, 0x20,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1544                     RFC1001_NAME_LEN);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1545             /*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1546              * FIXME: are there cases in which a comma can
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1547              * be valid in workstation netbios name (and
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1548              * need special handling)?
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1549              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1550             for (i =3D 0; i < RFC1001_NAME_LEN; i++) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1551                     /* don't ucase netbiosname for user */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1552                     if (param->string[i] =3D=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1553                             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1554                     ctx->source_rfc1001_name[i] =3D
param->string[i];
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1555             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1556             /* The string has 16th byte zero still from
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1557              * set at top of the function
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1558              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1559             if (i =3D=3D RFC1001_NAME_LEN && param->string[i] !=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1560                     pr_warn("netbiosname longer than 15
truncated\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1561             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1562     case Opt_servern:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1563             /* last byte, type, is 0x20 for servr type */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1564             memset(ctx->target_rfc1001_name, 0x20,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1565                     RFC1001_NAME_LEN_WITH_NULL);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1566             /*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1567              * BB are there cases in which a comma can be valid
in this
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1568              * workstation netbios name (and need special
handling)?
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1569              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  157=
0
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1571             /* user or mount helper must uppercase the netbios
name */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1572             for (i =3D 0; i < 15; i++) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1573                     if (param->string[i] =3D=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1574                             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1575                     ctx->target_rfc1001_name[i] =3D
param->string[i];
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1576             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  157=
7
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1578             /* The string has 16th byte zero still from set at
top of function */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1579             if (i =3D=3D RFC1001_NAME_LEN && param->string[i] !=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1580                     pr_warn("server netbiosname longer than 15
truncated\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1581             break;
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1582     case Opt_nbsessinit:
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1583             ctx->rfc1001_sessinit =3D !result.negated;
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1584             cifs_dbg(FYI, "rfc1001_sessinit set to %d\n",
ctx->rfc1001_sessinit);
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-27
 1585             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1586     case Opt_ver:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1587             /* version of mount userspace tools, not dialect */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1588             /* If interface changes in mount.cifs bump to new
ver */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1589             if (strncasecmp(param->string, "1", 1) =3D=3D 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1590                     if (strlen(param->string) > 1) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1591                             pr_warn("Bad mount helper ver=3D%s.
Did you want SMB1 (CIFS) dialect and mean to type vers=3D1.0
instead?\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1592                                     param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1593                             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1594                     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1595                     /* This is the default */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1596                     break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1597             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1598             /* For all other value, error */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1599             pr_warn("Invalid mount helper version specified\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1600             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1601     case Opt_vers:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1602             /* protocol version (dialect) */
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1603             if (cifs_parse_smb_version(fc, param->string, ctx,
is_smb3) !=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1604                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1605             ctx->got_version =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1606             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1607     case Opt_sec:
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1608             if (cifs_parse_security_flavors(fc, param->string,
ctx) !=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1609                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1610             break;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1611     case Opt_upcalltarget:
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1612             if (cifs_parse_upcall_target(fc, param->string, ctx)
!=3D 0)
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1613                     goto cifs_parse_mount_err;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1614             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1615     case Opt_cache:
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1616             if (cifs_parse_cache_flavor(fc, param->string, ctx)
!=3D 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1617                     goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1618             break;
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1619     case Opt_witness:
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1620  #ifndef CONFIG_CIFS_SWN_UPCALL
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1621             cifs_errorf(fc, "Witness support needs
CONFIG_CIFS_SWN_UPCALL config option\n");
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1622                     goto cifs_parse_mount_err;
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1623  #endif
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1624             ctx->witness =3D true;
dd538034f84fa4 fs/cifs/fs_context.c       Steve French      2020-12-14
 1625             pr_warn_once("Witness protocol support is
experimental\n");
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11
 1626             break;
e14b64247438e5 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-06
 1627     case Opt_unicode:
e14b64247438e5 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-06
 1628             ctx->unicode =3D !result.negated;
e14b64247438e5 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-06
 1629             cifs_dbg(FYI, "unicode set to %d\n", ctx->unicode);
e14b64247438e5 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-06
 1630             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1631     case Opt_rootfs:
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18
 1632  #ifndef CONFIG_CIFS_ROOT
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18
 1633             cifs_dbg(VFS, "rootfs support requires
CONFIG_CIFS_ROOT config option\n");
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18
 1634             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1635  #endif
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18
 1636             ctx->rootfs =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1637             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1638     case Opt_posixpaths:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1639             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1640                     ctx->posix_paths =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1641             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1642                     ctx->posix_paths =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1643             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1644     case Opt_unix:
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1645             if (result.negated) {
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1646                     if (ctx->linux_ext =3D=3D 1)
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1647                             pr_warn_once("conflicting posix
mount options specified\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1648                     ctx->linux_ext =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1649                     ctx->no_linux_ext =3D 1;
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1650             } else {
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1651                     if (ctx->no_linux_ext =3D=3D 1)
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1652                             pr_warn_once("conflicting posix
mount options specified\n");
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1653                     ctx->linux_ext =3D 1;
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1654                     ctx->no_linux_ext =3D 0;
6b445309eec2bc fs/smb/client/fs_context.c Paulo Alcantara   2025-07-31
 1655                     ctx->nonativesocket =3D 1; /* POSIX mounts use
NFS style reparse points */
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23
 1656             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1657             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1658     case Opt_nocase:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1659             ctx->nocase =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1660             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1661     case Opt_brl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1662             if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1663                     /*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1664                      * turn off mandatory locking in mode
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1665                      * if remote locking is turned off since the
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1666                      * local vfs will do advisory
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1667                      */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1668                     if (ctx->file_mode =3D=3D
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1669                             (S_IALLUGO & ~(S_ISUID | S_IXGRP)))
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1670                             ctx->file_mode =3D S_IALLUGO;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1671                     ctx->nobrl =3D  1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1672             } else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1673                     ctx->nobrl =3D  0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1674             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1675     case Opt_handlecache:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1676             if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1677                     ctx->nohandlecache =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1678             else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1679                     ctx->nohandlecache =3D 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1680             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1681     case Opt_forcemandatorylock:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1682             ctx->mand_lock =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1683             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1684     case Opt_setuids:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1685             ctx->setuids =3D result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1686             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1687     case Opt_intr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1688             ctx->intr =3D !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1689             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1690     case Opt_setuidfromacl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1691             ctx->setuidfromacl =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1692             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1693     case Opt_strictsync:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1694             ctx->nostrictsync =3D result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1695             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1696     case Opt_serverino:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1697             ctx->server_ino =3D !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1698             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1699     case Opt_rwpidforward:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1700             ctx->rwpidforward =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1701             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1702     case Opt_modesid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1703             ctx->mode_ace =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1704             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1705     case Opt_cifsacl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1706             ctx->cifs_acl =3D !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1707             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1708     case Opt_acl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1709             ctx->no_psx_acl =3D result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1710             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1711     case Opt_locallease:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1712             ctx->local_lease =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1713             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1714     case Opt_sign:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1715             ctx->sign =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1716             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1717     case Opt_ignore_signature:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1718             ctx->sign =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1719             ctx->ignore_signature =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1720             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1721     case Opt_seal:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1722             /* we do not do the following in secFlags because
seal
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1723              * is a per tree connection (mount) not a per socket
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1724              * or per-smb connection option in the protocol
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1725              * vol->secFlg |=3D CIFSSEC_MUST_SEAL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1726              */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1727             ctx->seal =3D 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1728             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1729     case Opt_noac:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1730             pr_warn("Mount option noac not supported. Instead
set /proc/fs/cifs/LookupCacheEnabled to 0\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1731             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1732     case Opt_fsc:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1733  #ifndef CONFIG_CIFS_FSCACHE
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1734             cifs_errorf(fc, "FS-Cache support needs
CONFIG_CIFS_FSCACHE kernel config option set\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1735             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1736  #endif
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1737             ctx->fsc =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1738             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1739     case Opt_mfsymlinks:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1740             ctx->mfsymlinks =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1741             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1742     case Opt_multiuser:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1743             ctx->multiuser =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1744             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1745     case Opt_sloppy:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1746             ctx->sloppy =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1747             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1748     case Opt_nosharesock:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1749             ctx->nosharesock =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1750             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1751     case Opt_persistent:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1752             if (result.negated) {
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16
 1753                     ctx->nopersistent =3D true;
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16
 1754                     if (ctx->persistent) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1755                             cifs_errorf(fc, "persistenthandles
mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1756                             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1757                     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1758             } else {
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16
 1759                     ctx->persistent =3D true;
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16
 1760                     if ((ctx->nopersistent) || (ctx->resilient))
{
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1761                             cifs_errorf(fc, "persistenthandles
mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1762                             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1763                     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1764             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1765             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1766     case Opt_resilient:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1767             if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1768                     ctx->resilient =3D false; /* already the
default */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1769             } else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1770                     ctx->resilient =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1771                     if (ctx->persistent) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01
 1772                             cifs_errorf(fc, "persistenthandles
mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1773                             goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1774                     }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1775             }
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1776             break;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1777     case Opt_tcp_nodelay:
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1778             /* tcp nodelay should not usually be needed since we
CORK/UNCORK the socket */
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1779             if (result.negated)
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1780                     ctx->sockopt_tcp_nodelay =3D false;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1781             else
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1782                     ctx->sockopt_tcp_nodelay =3D true;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14
 1783             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1784     case Opt_domainauto:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1785             ctx->domainauto =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1786             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1787     case Opt_rdma:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1788             ctx->rdma =3D true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1789             break;
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21
 1790     case Opt_reparse:
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21
 1791             if (parse_reparse_flavor(fc, param->string, ctx))
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21
 1792                     goto cifs_parse_mount_err;
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21
 1793             break;
45a99d5d117300 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-16
 1794     case Opt_nativesocket:
45a99d5d117300 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-16
 1795             ctx->nonativesocket =3D result.negated;
45a99d5d117300 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-16
 1796             break;
660618dde2b4c3 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-11
 1797     case Opt_symlink:
660618dde2b4c3 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-11
 1798             if (parse_symlink_flavor(fc, param->string, ctx))
660618dde2b4c3 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-11
 1799                     goto cifs_parse_mount_err;
660618dde2b4c3 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-10-11
 1800             break;
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1801     case Opt_symlinkroot:
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1802             if (param->string[0] !=3D '/') {
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1803                     cifs_errorf(fc, "symlinkroot mount options
must be absolute path\n");
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1804                     goto cifs_parse_mount_err;
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1805             }
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1806             if (strnlen(param->string, PATH_MAX) =3D=3D PATH_MAX) {
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1807                     cifs_errorf(fc, "symlinkroot path too long
(max path length: %u)\n",
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1808                                 PATH_MAX - 1);
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1809                     goto cifs_parse_mount_err;
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1810             }
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1811             kfree(ctx->symlinkroot);
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1812             ctx->symlinkroot =3D param->string;
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03
 1813             param->string =3D NULL;
12b466eb52d926 fs/smb/client/fs_context.c Pali Roh=C3=A1r        2024-09-23
 1814             break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1815     }
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16
 1816     /* case Opt_ignore: - is ignored as expected ... */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  181=
7
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1818     if (ctx->multiuser && ctx->upcall_target =3D=3D UPTARGET_MOUNT)
{
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1819             cifs_errorf(fc, "multiuser mount option not
supported with upcalltarget set as 'mount'\n");
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1820             goto cifs_parse_mount_err;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11
 1821     }
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  182=
2
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1823     /*
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1824      * Multichannel is not meaningful if max_channels is 1.
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1825      * Force multichannel to false to ensure consistent
configuration.
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1826      */
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1827     if (ctx->multichannel && ctx->max_channels =3D=3D 1)
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22
 1828             ctx->multichannel =3D false;
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  182=
9
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1830     return 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  183=
1
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10
 1832   cifs_parse_mount_err:
a4e430c8c8ba96 fs/cifs/fs_context.c       Enzo Matsumiya    2022-09-20
 1833     kfree_sensitive(ctx->password);
e6e43b8aa7cd3c fs/smb/client/fs_context.c Quang Le          2023-09-29
 1834     ctx->password =3D NULL;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1835     kfree_sensitive(ctx->password2);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04
 1836     ctx->password2 =3D NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
 1837     kfree(ctx->source);
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
 1838     ctx->source =3D NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
@1839     if (fc) {

         ^^^^^^^^^
So, no need for this NULL check.

d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
 1840             kfree(fc->source);
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
 1841             fc->source =3D NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18
 1842     }
bd2f0b43c1c864 fs/cifs/fs_context.c       Steve French      2021-01-28
 1843     return -EINVAL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  184=
4  }

--
0-DAY CI Kernel Test Service
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fintel%2Flkp-tests%2Fwiki&data=3D05%7C02%7CSteven.French%40microsoft.c=
om%7Cbea1e4e83b264d13e23408de2804bdd8%7C72f988bf86f141af91ab2d7cd011db47%7C=
1%7C0%7C638992198020463304%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C=
%7C%7C&sdata=3DXqlYlwUVQB0cYr8mYFNzRBqQcuPcQbMgJ80R41mDYjU%3D&reserved=3D0



--=20
Thanks,

Steve

--00000000000085995e06440323e7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-fix-memory-leak-in-smb3_fs_context_parse_param-.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-fix-memory-leak-in-smb3_fs_context_parse_param-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mi77t3td0>
X-Attachment-Id: f_mi77t3td0

RnJvbSA3ZTRkOTEyMGNmYTQxM2RkMzRmNGY0MzRiZWZjNWRiZTZjMzhiMmU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGF1cnlhIFJhbmUgPHNzcmFuZV9iMjNAZWUudmp0aS5hYy5p
bj4KRGF0ZTogVHVlLCAxOCBOb3YgMjAyNSAyMDozMjo1NyArMDUzMApTdWJqZWN0OiBbUEFUQ0hd
IGNpZnM6IGZpeCBtZW1vcnkgbGVhayBpbiBzbWIzX2ZzX2NvbnRleHRfcGFyc2VfcGFyYW0gZXJy
b3IKIHBhdGgKCkFkZCBwcm9wZXIgY2xlYW51cCBvZiBjdHgtPnNvdXJjZSBhbmQgZmMtPnNvdXJj
ZSB0byB0aGUKY2lmc19wYXJzZV9tb3VudF9lcnIgZXJyb3IgaGFuZGxlci4gVGhpcyBlbnN1cmVz
IHRoYXQgbWVtb3J5IGFsbG9jYXRlZApmb3IgdGhlIHNvdXJjZSBzdHJpbmdzIGlzIGNvcnJlY3Rs
eSBmcmVlZCBvbiBhbGwgZXJyb3IgcGF0aHMsIG1hdGNoaW5nCnRoZSBjbGVhbnVwIGFscmVhZHkg
cGVyZm9ybWVkIGluIHRoZSBzdWNjZXNzIHBhdGggYnkKc21iM19jbGVhbnVwX2ZzX2NvbnRleHRf
Y29udGVudHMoKS4KUG9pbnRlcnMgYXJlIGFsc28gc2V0IHRvIE5VTEwgYWZ0ZXIgZnJlZWluZyB0
byBwcmV2ZW50IHBvdGVudGlhbApkb3VibGUtZnJlZSBpc3N1ZXMuCgpUaGlzIGNoYW5nZSBmaXhl
cyBhIG1lbW9yeSBsZWFrIG9yaWdpbmFsbHkgZGV0ZWN0ZWQgYnkgc3l6Ym90LiBUaGUKbGVhayBv
Y2N1cnJlZCB3aGVuIHByb2Nlc3NpbmcgT3B0X3NvdXJjZSBtb3VudCBvcHRpb25zIGlmIGFuIGVy
cm9yCmhhcHBlbmVkIGFmdGVyIGN0eC0+c291cmNlIGFuZCBmYy0+c291cmNlIHdlcmUgc3VjY2Vz
c2Z1bGx5CmFsbG9jYXRlZCBidXQgYmVmb3JlIHRoZSBmdW5jdGlvbiBjb21wbGV0ZWQuCgpUaGUg
c3BlY2lmaWMgbGVhayBzZXF1ZW5jZSB3YXM6CjEuIGN0eC0+c291cmNlID0gc21iM19mc19jb250
ZXh0X2Z1bGxwYXRoKGN0eCwgJy8nKSBhbGxvY2F0ZXMgbWVtb3J5CjIuIGZjLT5zb3VyY2UgPSBr
c3RyZHVwKGN0eC0+c291cmNlLCBHRlBfS0VSTkVMKSBhbGxvY2F0ZXMgbW9yZSBtZW1vcnkKMy4g
QSBzdWJzZXF1ZW50IGVycm9yIGp1bXBzIHRvIGNpZnNfcGFyc2VfbW91bnRfZXJyCjQuIFRoZSBv
bGQgZXJyb3IgaGFuZGxlciBmcmVlZCBwYXNzd29yZHMgYnV0IG5vdCB0aGUgc291cmNlIHN0cmlu
Z3MsCmNhdXNpbmcgdGhlIG1lbW9yeSB0byBsZWFrLgoKVGhpcyBpc3N1ZSB3YXMgbm90IGFkZHJl
c3NlZCBieSBjb21taXQgZThjNzNlYjdkYjBhICgiY2lmczogY2xpZW50OgpmaXggbWVtb3J5IGxl
YWsgaW4gc21iM19mc19jb250ZXh0X3BhcnNlX3BhcmFtIiksIHdoaWNoIG9ubHkgZml4ZWQKbGVh
a3MgZnJvbSByZXBlYXRlZCBmc2NvbmZpZygpIGNhbGxzIGJ1dCBub3QgdGhpcyBlcnJvciBwYXRo
LgoKUGF0Y2ggdXBkYXRlZCB3aXRoIG1pbm9yIGNoYW5nZSBzdWdnZXN0ZWQgYnkga2VybmVsIHRl
c3Qgcm9ib3QKClJlcG9ydGVkLWJ5OiBzeXpib3QrODdiZTY4MDllZDliZjZkNzE4ZTNAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L2J1Zz9leHRpZD04N2JlNjgwOWVkOWJmNmQ3MThlMwpGaXhlczogMjRlMGExZWZmOWUyICgiY2lm
czogc3dpdGNoIHRvIG5ldyBtb3VudCBhcGkiKQpSZXZpZXdlZC1ieTogRGF2aWQgSG93ZWxscyA8
ZGhvd2VsbHNAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2hhdXJ5YSBSYW5lIDxzc3JhbmVf
YjIzQGVlLnZqdGkuYWMuaW4+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hA
bWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2ZzX2NvbnRleHQuYyB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGll
bnQvZnNfY29udGV4dC5jIGIvZnMvc21iL2NsaWVudC9mc19jb250ZXh0LmMKaW5kZXggMGY4OTRk
MDkxNTdiLi4yYTBkOGI4N2JkOGUgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jbGllbnQvZnNfY29udGV4
dC5jCisrKyBiL2ZzL3NtYi9jbGllbnQvZnNfY29udGV4dC5jCkBAIC0xODM0LDYgKzE4MzQsMTAg
QEAgc3RhdGljIGludCBzbWIzX2ZzX2NvbnRleHRfcGFyc2VfcGFyYW0oc3RydWN0IGZzX2NvbnRl
eHQgKmZjLAogCWN0eC0+cGFzc3dvcmQgPSBOVUxMOwogCWtmcmVlX3NlbnNpdGl2ZShjdHgtPnBh
c3N3b3JkMik7CiAJY3R4LT5wYXNzd29yZDIgPSBOVUxMOworCWtmcmVlKGN0eC0+c291cmNlKTsK
KwljdHgtPnNvdXJjZSA9IE5VTEw7CisJa2ZyZWUoZmMtPnNvdXJjZSk7CisJZmMtPnNvdXJjZSA9
IE5VTEw7CiAJcmV0dXJuIC1FSU5WQUw7CiB9CiAKLS0gCjIuNTEuMAoK
--00000000000085995e06440323e7--
