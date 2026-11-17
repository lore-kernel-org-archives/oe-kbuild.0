Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937384;
	b=rinuP9Dl84+MAafQSkynSe33vxAz3lrVsOzTgBBrNfGrb2DT3i3TGZ9m1/oFq/vBIoEN
	 dzhVKmJWQCY5ksAiYJQIBuFIc49SmiteWfjHj0WJT4/fIDDRu0KrWEfDa9rL6YrS+lBaB
	 /4o8qltZLO6bePxOHrBvd5zQZZ0WZd9XCeZHb3UxAShPOgkOSW3GPBvIbfvaTekkfzShJ
	 X929ODbcS8I34YNuhKZZL8aJhoH8TWj0wfLtlN5pCzTJ7MFiFKNPL4/F0q3xYGbEL9k1t
	 3mKuAzG3sWBtq4HeVvty8WXHs1/0GvyQdyGqY7IILYUo/ISR7rSL1yRc6/Ri6M7p7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qe0V8+yj6WFjjvAEmXN/tvdocnoLYIujyb5EGTTpti4=;
	b=W6P8plfxBVlu+OFsL0ggyTadcH8hDYxvXAqe8wQM0z53sslQ1w5jBDdcIgHFsTYJlI+Y
	 b54I2GYgYj2XB/p4q6W9HVtwjGMtBhsxwUvzQvPQImrehjc0odAxIVQ3Fls7zWHTijyuU
	 Eikh5odZ9K86eyc85L+LfsNgzOANa60u1DWOU3O3phIgJTDFrsZ6rADVXF2s6+iPmXDj0
	 IAlhUdeRXjN5D7pJdf8c2VVc6IZxqhIoLJ3J6KVOsoT80J55FfpC6rUb5Q57lxyYvF/ZU
	 fDAfVjLEAeL44Mmh/wTCwtviAc4TBy83Xf8GfyctwxClT7YbQjnhEmRqyNlnkiqGxeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4SSoFWx;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC86606A32A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC86606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4SSoFWx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794937384; x=1826473384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h3tvHwBui1wEozWwRBSlhWUO/mjaKUjpqUk+MmvRgcg=;
  b=U4SSoFWxhf1qj9LaU40kVUJyox+MelBI2TjKAI7CU3yevotEJVXYg5oR
   9Yi8z4SE4jn1gTpSKTlcbyDOyS3HYHkyBs4hHfud9U9+5ElIhOBL7qOft
   OI9MmW3I43Bb1IzUQ/2SyhdU+aVHB/wrUuwcELuB9rEpB2nGiM3wmd24z
   tqGKTo47ORsfo59VcscdUhX+Xp2CdJfZN4T5x8Q63SVR1TMbD8DeIcqKA
   YPtfq98OMBC/tNOw6zNvOy59TEYyiBlFs9UUmke2tnJptrzIVscaYWf9z
   /z5yat/+7ii+er4gB7bFemQKDetfeuA0DFGMFVE6KB7CdwunwwAD1sSwZ
   w==;
X-CSE-ConnectionGUID: 6BdIn+9+TMyn94jZxThFPQ==
X-CSE-MsgGUID: JwyZRclNQyaZhuMdgNtnuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3615108"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3615108"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 09:43:03 -0800
X-CSE-ConnectionGUID: ZTi5A/hOTC+RPTdkoroF8w==
X-CSE-MsgGUID: AEvSz70RRduIJM3Z7Gft7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9863452"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2026 09:43:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTNCu-000000003As-0fxb;
	Tue, 17 Nov 2026 17:43:00 +0000
Date: Tue, 17 Nov 2026 18:42:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: security/integrity/ima/ima_appraise.c:567:29-30: WARNING
 opportunity for min()
Message-ID: <20261117184141.bRS2fSzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frederick Lawler <fred@cloudflare.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Enrico Bravi <enrico.bravi@polito.it>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: ca1e0f3cce8a40f97ab3364030a22fbd9e663d33 integrity: Report error co=
de in integrity_audit_msg() call sites
date:   7 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 weeks ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/ar=
chive/20261117/20261117184141.bRS2fSzI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 563=
7411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ca1e0f3cce8a ("integrity: Report error code in integrity_audit_msg=
() call sites")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117184141.bRS2fSzI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_appraise.c:567:29-30: WARNING opportunity for=
 min()
   security/integrity/ima/ima_appraise.c:592:29-30: WARNING opportunity for=
 min()

vim +567 security/integrity/ima/ima_appraise.c

273df864cf7466 Nayna Jain            2019-10-30  453 =20
2fe5d6def1672a Mimi Zohar            2012-02-13  454  /*
2fe5d6def1672a Mimi Zohar            2012-02-13  455   * ima_appraise_measu=
rement - appraise file measurement
2fe5d6def1672a Mimi Zohar            2012-02-13  456   *
2fe5d6def1672a Mimi Zohar            2012-02-13  457   * Call evm_verifyxat=
tr() to verify the integrity of 'security.ima'.
2fe5d6def1672a Mimi Zohar            2012-02-13  458   * Assuming success, =
compare the xattr hash with the collected measurement.
2fe5d6def1672a Mimi Zohar            2012-02-13  459   *
2fe5d6def1672a Mimi Zohar            2012-02-13  460   * Return 0 on succes=
s, error code otherwise
2fe5d6def1672a Mimi Zohar            2012-02-13  461   */
4de2f084fbff41 Roberto Sassu         2024-02-15  462  int ima_appraise_meas=
urement(enum ima_hooks func, struct ima_iint_cache *iint,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  463  			     struct file *=
file, const unsigned char *filename,
d3634d0f426bde Dmitry Kasatkin       2013-04-25  464  			     struct evm_im=
a_xattr_data *xattr_value,
377cae9851e855 Chris J Arges         2025-12-27  465  			     int xattr_len=
, const struct modsig *modsig,
377cae9851e855 Chris J Arges         2025-12-27  466  			     bool bprm_is_=
check)
2fe5d6def1672a Mimi Zohar            2012-02-13  467  {
52a13284844b35 Mimi Zohar            2013-12-11  468  	static const char op=
[] =3D "appraise_data";
95b3cdafd7cb74 Mimi Zohar            2024-12-12  469  	int audit_msgno =3D =
AUDIT_INTEGRITY_DATA;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  470  	const char *cause =
=3D "unknown";
e71b9dff0634ed Miklos Szeredi        2016-09-16  471  	struct dentry *dentr=
y =3D file_dentry(file);
c6f493d631c4d4 David Howells         2015-03-17  472  	struct inode *inode =
=3D d_backing_inode(dentry);
2fe5d6def1672a Mimi Zohar            2012-02-13  473  	enum integrity_statu=
s status =3D INTEGRITY_UNKNOWN;
a5fbeb615ca42f Thiago Jung Bauermann 2019-06-27  474  	int rc =3D xattr_len;
39b07096364a42 Thiago Jung Bauermann 2019-06-27  475  	bool try_modsig =3D =
iint->flags & IMA_MODSIG_ALLOWED && modsig;
2fe5d6def1672a Mimi Zohar            2012-02-13  476 =20
39b07096364a42 Thiago Jung Bauermann 2019-06-27  477  	/* If not appraising=
 a modsig, we need an xattr. */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  478  	if (!(inode->i_opfla=
gs & IOP_XATTR) && !try_modsig)
2fe5d6def1672a Mimi Zohar            2012-02-13  479  		return INTEGRITY_UN=
KNOWN;
2fe5d6def1672a Mimi Zohar            2012-02-13  480 =20
95b3cdafd7cb74 Mimi Zohar            2024-12-12  481  	/*
95b3cdafd7cb74 Mimi Zohar            2024-12-12  482  	 * Unlike any of the=
 other LSM hooks where the kernel enforces file
95b3cdafd7cb74 Mimi Zohar            2024-12-12  483  	 * integrity, enforc=
ing file integrity for the bprm_creds_for_exec()
95b3cdafd7cb74 Mimi Zohar            2024-12-12  484  	 * LSM hook with the=
 AT_EXECVE_CHECK flag is left up to the discretion
95b3cdafd7cb74 Mimi Zohar            2024-12-12  485  	 * of the script int=
erpreter(userspace). Differentiate kernel and
95b3cdafd7cb74 Mimi Zohar            2024-12-12  486  	 * userspace enforce=
d integrity audit messages.
95b3cdafd7cb74 Mimi Zohar            2024-12-12  487  	 */
377cae9851e855 Chris J Arges         2025-12-27  488  	if (bprm_is_check)
95b3cdafd7cb74 Mimi Zohar            2024-12-12  489  		audit_msgno =3D AUD=
IT_INTEGRITY_USERSPACE;
95b3cdafd7cb74 Mimi Zohar            2024-12-12  490 =20
39b07096364a42 Thiago Jung Bauermann 2019-06-27  491  	/* If reading the xa=
ttr failed and there's no modsig, error out. */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  492  	if (rc <=3D 0 && !tr=
y_modsig) {
2fe5d6def1672a Mimi Zohar            2012-02-13  493  		if (rc && rc !=3D -=
ENODATA)
2fe5d6def1672a Mimi Zohar            2012-02-13  494  			goto out;
2fe5d6def1672a Mimi Zohar            2012-02-13  495 =20
398c42e2c46c88 Mimi Zohar            2021-11-24  496  		if (iint->flags & I=
MA_DIGSIG_REQUIRED) {
398c42e2c46c88 Mimi Zohar            2021-11-24  497  			if (iint->flags & =
IMA_VERITY_REQUIRED)
398c42e2c46c88 Mimi Zohar            2021-11-24  498  				cause =3D "verity=
-signature-required";
398c42e2c46c88 Mimi Zohar            2021-11-24  499  			else
398c42e2c46c88 Mimi Zohar            2021-11-24  500  				cause =3D "IMA-si=
gnature-required";
398c42e2c46c88 Mimi Zohar            2021-11-24  501  		} else {
398c42e2c46c88 Mimi Zohar            2021-11-24  502  			cause =3D "missing=
-hash";
398c42e2c46c88 Mimi Zohar            2021-11-24  503  		}
398c42e2c46c88 Mimi Zohar            2021-11-24  504 =20
b151d6b00bbb79 Dmitry Kasatkin       2014-06-27  505  		status =3D INTEGRIT=
Y_NOLABEL;
6035a27b25ab9d Al Viro               2018-06-08  506  		if (file->f_mode & =
FMODE_CREATED)
b151d6b00bbb79 Dmitry Kasatkin       2014-06-27  507  			iint->flags |=3D I=
MA_NEW_FILE;
1ac202e978e18f Daniel Gl=C3=B6ckner       2017-02-24  508  		if ((iint->fla=
gs & IMA_NEW_FILE) &&
b7e27bc1d42e8e Mimi Zohar            2017-11-08  509  		    (!(iint->flags =
& IMA_DIGSIG_REQUIRED) ||
b7e27bc1d42e8e Mimi Zohar            2017-11-08  510  		     (inode->i_size=
 =3D=3D 0)))
b151d6b00bbb79 Dmitry Kasatkin       2014-06-27  511  			status =3D INTEGRI=
TY_PASS;
2fe5d6def1672a Mimi Zohar            2012-02-13  512  		goto out;
2fe5d6def1672a Mimi Zohar            2012-02-13  513  	}
2fe5d6def1672a Mimi Zohar            2012-02-13  514 =20
d2ee2cfc4aa85f Huaxin Lu             2022-07-05  515  	status =3D evm_verif=
yxattr(dentry, XATTR_NAME_IMA, xattr_value,
75a323e604fc77 Roberto Sassu         2024-02-15  516  				 rc < 0 ? 0 : rc);
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  517  	switch (status) {
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  518  	case INTEGRITY_PASS:
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  519  	case INTEGRITY_PASS_=
IMMUTABLE:
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  520  	case INTEGRITY_UNKNO=
WN:
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  521  		break;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  522  	case INTEGRITY_NOXAT=
TRS:	/* No EVM protected xattrs. */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  523  		/* It's fine not to=
 have xattrs when using a modsig. */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  524  		if (try_modsig)
39b07096364a42 Thiago Jung Bauermann 2019-06-27  525  			break;
df561f6688fef7 Gustavo A. R. Silva   2020-08-23  526  		fallthrough;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  527  	case INTEGRITY_NOLAB=
EL:		/* No security.evm xattr. */
2fe5d6def1672a Mimi Zohar            2012-02-13  528  		cause =3D "missing-=
HMAC";
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  529  		goto out;
cdef685be5b4ae Roberto Sassu         2021-05-14  530  	case INTEGRITY_FAIL_=
IMMUTABLE:
7aa5783d95646f Roberto Sassu         2021-05-14  531  		set_bit(IMA_DIGSIG,=
 &iint->atomic_flags);
55748ac6a6d3e3 Mimi Zohar            2021-06-02  532  		cause =3D "invalid-=
fail-immutable";
55748ac6a6d3e3 Mimi Zohar            2021-06-02  533  		goto out;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  534  	case INTEGRITY_FAIL:=
		/* Invalid HMAC/signature. */
2fe5d6def1672a Mimi Zohar            2012-02-13  535  		cause =3D "invalid-=
HMAC";
2fe5d6def1672a Mimi Zohar            2012-02-13  536  		goto out;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  537  	default:
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  538  		WARN_ONCE(true, "Un=
expected integrity status %d\n", status);
2fe5d6def1672a Mimi Zohar            2012-02-13  539  	}
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  540 =20
a5fbeb615ca42f Thiago Jung Bauermann 2019-06-27  541  	if (xattr_value)
a5fbeb615ca42f Thiago Jung Bauermann 2019-06-27  542  		rc =3D xattr_verify=
(func, iint, xattr_value, xattr_len, &status,
a5fbeb615ca42f Thiago Jung Bauermann 2019-06-27  543  				  &cause);
8606404fa555c2 Dmitry Kasatkin       2011-08-31  544 =20
39b07096364a42 Thiago Jung Bauermann 2019-06-27  545  	/*
39b07096364a42 Thiago Jung Bauermann 2019-06-27  546  	 * If we have a mods=
ig and either no imasig or the imasig's key isn't
39b07096364a42 Thiago Jung Bauermann 2019-06-27  547  	 * known, then try v=
erifying the modsig.
39b07096364a42 Thiago Jung Bauermann 2019-06-27  548  	 */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  549  	if (try_modsig &&
39b07096364a42 Thiago Jung Bauermann 2019-06-27  550  	    (!xattr_value ||=
 xattr_value->type =3D=3D IMA_XATTR_DIGEST_NG ||
39b07096364a42 Thiago Jung Bauermann 2019-06-27  551  	     rc =3D=3D -ENOK=
EY))
39b07096364a42 Thiago Jung Bauermann 2019-06-27  552  		rc =3D modsig_verif=
y(func, modsig, &status, &cause);
39b07096364a42 Thiago Jung Bauermann 2019-06-27  553 =20
2fe5d6def1672a Mimi Zohar            2012-02-13  554  out:
57b56ac6fecb05 Mimi Zohar            2018-02-21  555  	/*
57b56ac6fecb05 Mimi Zohar            2018-02-21  556  	 * File signatures o=
n some filesystems can not be properly verified.
9e67028e76514a Mimi Zohar            2018-02-21  557  	 * When such filesys=
tems are mounted by an untrusted mounter or on a
9e67028e76514a Mimi Zohar            2018-02-21  558  	 * system not willin=
g to accept such a risk, fail the file signature
9e67028e76514a Mimi Zohar            2018-02-21  559  	 * verification.
57b56ac6fecb05 Mimi Zohar            2018-02-21  560  	 */
9e67028e76514a Mimi Zohar            2018-02-21  561  	if ((inode->i_sb->s_=
iflags & SB_I_IMA_UNVERIFIABLE_SIGNATURE) &&
9e67028e76514a Mimi Zohar            2018-02-21  562  	    ((inode->i_sb->s=
_iflags & SB_I_UNTRUSTED_MOUNTER) ||
9e67028e76514a Mimi Zohar            2018-02-21  563  	     (iint->flags & =
IMA_FAIL_UNVERIFIABLE_SIGS))) {
57b56ac6fecb05 Mimi Zohar            2018-02-21  564  		status =3D INTEGRIT=
Y_FAIL;
57b56ac6fecb05 Mimi Zohar            2018-02-21  565  		cause =3D "unverifi=
able-signature";
95b3cdafd7cb74 Mimi Zohar            2024-12-12  566  		integrity_audit_msg=
(audit_msgno, inode, filename,
ca1e0f3cce8a40 Frederick Lawler      2026-09-24 @567  				    op, cause, rc=
, 0, rc < 0 ? rc : 0);
57b56ac6fecb05 Mimi Zohar            2018-02-21  568  	} else if (status !=
=3D INTEGRITY_PASS) {
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  569  		/* Fix mode, but do=
n't replace file signatures. */
39b07096364a42 Thiago Jung Bauermann 2019-06-27  570  		if ((ima_appraise &=
 IMA_APPRAISE_FIX) && !try_modsig &&
8606404fa555c2 Dmitry Kasatkin       2011-08-31  571  		    (!xattr_value ||
8606404fa555c2 Dmitry Kasatkin       2011-08-31  572  		     xattr_value->t=
ype !=3D EVM_IMA_XATTR_DIGSIG)) {
def3e8b9ee23cb Dmitry Kasatkin       2012-09-20  573  			if (!ima_fix_xattr=
(dentry, iint))
2fe5d6def1672a Mimi Zohar            2012-02-13  574  				status =3D INTEGR=
ITY_PASS;
0ec959cf4b5a60 Coiby Xu              2025-09-30  575  		} else if (status =
=3D=3D INTEGRITY_NOLABEL) {
0ec959cf4b5a60 Coiby Xu              2025-09-30  576  			if (!evm_fix_hmac(=
dentry, XATTR_NAME_IMA,
0ec959cf4b5a60 Coiby Xu              2025-09-30  577  					  (const char *)=
xattr_value,
0ec959cf4b5a60 Coiby Xu              2025-09-30  578  					  xattr_len))
0ec959cf4b5a60 Coiby Xu              2025-09-30  579  				status =3D INTEGR=
ITY_PASS;
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  580  		}
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  581 =20
7aa5783d95646f Roberto Sassu         2021-05-14  582  		/*
7aa5783d95646f Roberto Sassu         2021-05-14  583  		 * Permit new files=
 with file/EVM portable signatures, but
7aa5783d95646f Roberto Sassu         2021-05-14  584  		 * without data.
7aa5783d95646f Roberto Sassu         2021-05-14  585  		 */
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  586  		if (inode->i_size =
=3D=3D 0 && iint->flags & IMA_NEW_FILE &&
7aa5783d95646f Roberto Sassu         2021-05-14  587  		    test_bit(IMA_DI=
GSIG, &iint->atomic_flags)) {
05d1a717ec0430 Mimi Zohar            2016-02-29  588  			status =3D INTEGRI=
TY_PASS;
2fe5d6def1672a Mimi Zohar            2012-02-13  589  		}
f5e51fa368fd66 Thiago Jung Bauermann 2018-03-15  590 =20
95b3cdafd7cb74 Mimi Zohar            2024-12-12  591  		integrity_audit_msg=
(audit_msgno, inode, filename,
ca1e0f3cce8a40 Frederick Lawler      2026-09-24  592  				    op, cause, rc=
, 0, rc < 0 ? rc : 0);
8606404fa555c2 Dmitry Kasatkin       2011-08-31  593  	} else {
d79d72e02485c0 Mimi Zohar            2012-12-03  594  		ima_cache_flags(iin=
t, func);
2fe5d6def1672a Mimi Zohar            2012-02-13  595  	}
57b56ac6fecb05 Mimi Zohar            2018-02-21  596 =20
d79d72e02485c0 Mimi Zohar            2012-12-03  597  	ima_set_cache_status=
(iint, func, status);
2fe5d6def1672a Mimi Zohar            2012-02-13  598  	return status;
2fe5d6def1672a Mimi Zohar            2012-02-13  599  }
2fe5d6def1672a Mimi Zohar            2012-02-13  600 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
