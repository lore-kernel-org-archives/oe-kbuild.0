Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043362FB607;
	Mon, 24 Nov 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981719; cv=none; b=CxNfyRWGKlOAMHlsbaY/T5BvKczzwe6LbAH+s0fNuy+dw7gNVE+g/PbmtDV+DKGGLzzoU8CWmf8VerJHePmpdHxq1/JaKjaRAZH3G7dMO7av6s+KrxdBR3okSvHUpX2D4doawioTitpRhw4QuAloVGClNbxVNI8NAe0iZBLKSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981719; c=relaxed/simple;
	bh=AEM0YGQ6DjPrRVcUaC9r30KLy7eGaofNTKHV2MEjPqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CAF6VjLlzfSd9KjwZzBbA6TuGH3hxu99IuBPbxQ6kMSMM1sZTwLmW5vGd7uhCncVPbDkRPtBkpntExknngGIRTlhyq9EWR3DFgQcyNPYtbuVCfAgPsgv/huaRf2DYSGNF6CxB0svAR+cSLNozm3UAP7Sm7a/hfYWiay9bAUAv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UNpeiPGE; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UNpeiPGE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=daliigqiCa0BGCXTLd5BJ1qCg3M8Xirctk+CfIkf0T4=; b=UNpeiPGEVjm9TqJCVexZzpuZ6F
	AsRTHzI/uXkdWp0uD1xuhsgZfhN+u96v7bCnyseG4htGX3BpB6p2uc2cBynmaix7PKU/qYFAMr9rD
	eyC87Om2F+KNAjBA6eZASQ488JvkygQ+UlSUBj9eZfdqw+s4fGJ6CrRsa0UyBvPvEdh4PNBCkTIar
	ljKlLnDxssmW7tpQfnUBqyi9Dqaa7E2e6KyrgfYc5sYtUyZxQS0BkuqWxiFaqVAlQNl0KVGoQlOUF
	2fEznMh7Cij8zNqy2J7ipee5Fm+mI0H7BUjn9Oj+gZfzYaKeAjSoQdNnn94GWl2ARi7zawY61D6zl
	6TpkisnA==;
Received: from bl17-145-117.dsl.telepac.pt ([188.82.145.117] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vNUDp-004igK-Bx; Mon, 24 Nov 2025 11:55:05 +0100
From: Luis Henriques <luis@igalia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  lkp@intel.com,  oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/3] fuse: implementation of the
 FUSE_LOOKUP_HANDLE operation
In-Reply-To: <202511232052.lN8GzRFA-lkp@intel.com> (Dan Carpenter's message of
	"Mon, 24 Nov 2025 11:14:49 +0300")
References: <202511232052.lN8GzRFA-lkp@intel.com>
Date: Mon, 24 Nov 2025 10:54:59 +0000
Message-ID: <87o6orlmyk.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24 2025, Dan Carpenter wrote:

> Hi Luis,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Henriques/fus=
e-initial-infrastructure-for-FUSE_LOOKUP_HANDLE-support/20251120-190106
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> patch link:    https://lore.kernel.org/r/20251120105535.13374-4-luis%40ig=
alia.com
> patch subject: [RFC PATCH v1 3/3] fuse: implementation of the FUSE_LOOKUP=
_HANDLE operation
> config: s390-randconfig-r071-20251123 (https://download.01.org/0day-ci/ar=
chive/20251123/202511232052.lN8GzRFA-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511232052.lN8GzRFA-lkp@intel.com/
>
> smatch warnings:
> fs/fuse/inode.c:1198 fuse_encode_lookup_fh() warn: potential pointer math=
 issue ('fh' is a 32 bit pointer)

Thanks for reporting this.  The issue seems to be real but this code is
broken in much more fundamental ways (see [0]).  I'll try to keep this
report in mind when re-writing for the next iteration.

[0] https://lore.kernel.org/all/CAOQ4uxgzThRacOhcwQcU6DAx7MEUc-8-Z6j9fSKzJp=
+kuc5=3D-Q@mail.gmail.com

Cheers,
--=20
Lu=C3=ADs

> vim +1198 fs/fuse/inode.c
>
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1182  static int fuse_encode_lo=
okup_fh(struct inode *inode, u32 *fh, int *max_len,
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1183  				 struct inode *parent)
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1184  {
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1185  	struct fuse_inode *fi =
=3D get_fuse_inode(inode);
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1186  	int total_len, len;
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1187=20=20
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1188  	total_len =3D len =3D si=
zeof(struct fuse_file_handle);
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1189  	if (parent)
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1190  		total_len *=3D 2;
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1191=20=20
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1192  	if (*max_len < total_len)
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1193  		return FILEID_INVALID;
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1194=20=20
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1195  	memcpy(fh, &fi->fh, len);
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1196  	if (parent) {
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1197  		fi =3D get_fuse_inode(p=
arent);
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20 @1198  		memcpy((fh + len), &fi-=
>fh, len);
>
> fh is a u32 pointer but len is in byte units so this is a pointer math
> bug.  It should be: memcpy((void *)fh + len, &fi->fh, len);
>
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1199  	}
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1200=20=20
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1201  	*max_len =3D total_len;
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1202=20=20
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1203  	/* XXX define new fid_ty=
pe */
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1204  	return parent ? FILEID_I=
NO64_GEN_PARENT : FILEID_INO64_GEN;
> c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1205  }
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

