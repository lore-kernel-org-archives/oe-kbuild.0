Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1D1F0E25
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 06:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888832; cv=none; b=nGIUDY8Cxy9KGy3DAPdhDm5CtzV+DF0NzOnbGHt+aW8j9L2+ACxNWrqL2gdommXJfXVpIYgQUKdhEVE48vgsBEKPhI2f2GSTi8N9fNeysXQ/HyewukYyojOCW1A5ZxI330x+G6pSCono9XgYelRAqp8Qzt+bBz+woi942mXQyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888832; c=relaxed/simple;
	bh=OG9baRZYvUPfPBc2277GONUsD8acl5Wtd3dnjFuhLIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZPQJHcPkXOX4ZQxesyDsBpFXT8F4lDOkDFRv3eiGl4NNRBQNSygnBXVRT7JQpFdKICNSGU/EDxNumcvGTrsYE92Sth/Du9LD4idADyW+jNjpERdAqvZjNHLVZqYZHQpfyFazIiNSqd9ZpI1rA+u9MV0oj4rBjGm9u5/3418g7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JusYHewP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JusYHewP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782888831; x=1814424831;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OG9baRZYvUPfPBc2277GONUsD8acl5Wtd3dnjFuhLIQ=;
  b=JusYHewP8vab7ceDVeq3zsa62NTZ0ecTTKYQ6gJa4m8wnYtM+4W1iG9x
   JAE4uIkZaI06IHkaE4udFgU2E+BvLd3ekmCZk86nh502eYH9jTZXRJSqv
   /HUdbkTQaroaW1E0RYYDJ5xDLdxlWNduUoTOwFYl0SXl9QjIgfmUb/C+v
   CFgICVhjBhtiakxZFSBOegJYfouoZAcYswqNY3mgbZvNdQ5VD+iPxhy+x
   oz1y+xTQPMuXa3ZkKT64zBQ8833q6EfOzVZ1ozpn8nXzqWIFECu3/MjAF
   F9qsKNU8f7PPfIDv7PmMre2ADc+BKrqLFUTkfWdNolOHYwSPIRFg2W87J
   A==;
X-CSE-ConnectionGUID: LGZZzemLTq620IsZX+wPZQ==
X-CSE-MsgGUID: 4D4SAhAuSSChHo9lkP4owg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83641349"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83641349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 23:53:51 -0700
X-CSE-ConnectionGUID: 12c+Dh59RHGYHCCyHyAcVw==
X-CSE-MsgGUID: uA8IBf/aTKeUe7wkfmyFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248005667"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jun 2026 23:53:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weonA-0000000090d-2EvJ;
	Wed, 01 Jul 2026 06:52:11 +0000
Date: Wed, 01 Jul 2026 14:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1673/2307]
 security/apparmor/apparmorfs.c:590 policy_update() warn: passing zero to
 'PTR_ERR'
Message-ID: <202607011451.icwPyCIk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Maxime B=C3=A9lair" <maxime.belair@canonical.com>
CC: John Johansen <john.johansen@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [1673/2307] apparmor: Init=
ial support for compressed policies
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260701 (https://download.01.org/0day-ci/arc=
hive/20260701/202607011451.icwPyCIk-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607011451.icwPyCIk-lkp@intel.com/

smatch warnings:
security/apparmor/apparmorfs.c:590 policy_update() warn: passing zero to 'P=
TR_ERR'

vim +/PTR_ERR +590 security/apparmor/apparmorfs.c

63e2b423771ab0 John Johansen 2010-07-29  548 =20
18e99f191a8e66 John Johansen 2017-05-26  549  static ssize_t policy_update(=
u32 mask, const char __user *buf, size_t size,
6601e13e828418 John Johansen 2025-11-07  550  			     loff_t *pos, struct a=
a_ns *ns,
6601e13e828418 John Johansen 2025-11-07  551  			     const struct cred *oc=
red)
63e2b423771ab0 John Johansen 2010-07-29  552  {
5ac8c355ae0013 John Johansen 2017-01-16  553  	struct aa_loaddata *data;
637f688dc3dc30 John Johansen 2017-06-09  554  	struct aa_label *label;
637f688dc3dc30 John Johansen 2017-06-09  555  	ssize_t error;
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  556  	char *compressed_data =
=3D NULL;
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  557  	__le32 magic_le;
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  558  	bool is_compressed;
cf797c0e5e3125 John Johansen 2017-06-09  559 =20
637f688dc3dc30 John Johansen 2017-06-09  560  	label =3D begin_current_labe=
l_crit_section();
cf797c0e5e3125 John Johansen 2017-06-09  561 =20
5ac8c355ae0013 John Johansen 2017-01-16  562  	/* high level check about po=
licy management - fine grained in
5ac8c355ae0013 John Johansen 2017-01-16  563  	 * below after unpack
5ac8c355ae0013 John Johansen 2017-01-16  564  	 */
6601e13e828418 John Johansen 2025-11-07  565  	error =3D aa_may_manage_poli=
cy(current_cred(), label, ns, ocred, mask);
5ac8c355ae0013 John Johansen 2017-01-16  566  	if (error)
c6b39f070722ea Xiyu Yang     2020-04-20  567  		goto end_section;
63e2b423771ab0 John Johansen 2010-07-29  568 =20
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  569  	/* If the policy is use=
rspace compressed we start by decompressing it
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  570  	 * to make the required=
 checks (computing hash, verifying profile, ...)
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  571  	 *
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  572  	 * Getting a userspace-=
compressed version then decompressing it in the
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  573  	 * kernel actually make=
s sense since zstd decompression is ~3.5x faster
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  574  	 * than compression. Th=
is also allow to increase the compression level.
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  575  	 */
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  576 =20
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  577  	if (size >=3D sizeof(__=
le32) &&
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  578  	    !copy_from_user(&ma=
gic_le, buf, sizeof(magic_le)) &&
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  579  	    le32_to_cpu(magic_l=
e) =3D=3D ZSTD_MAGICNUMBER)
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  580  		is_compressed =3D true;
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  581  	else
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  582  		is_compressed =3D fals=
e;
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  583 =20
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  584  	if (is_compressed) {
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  585 =20
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  586  		data =3D aa_get_data_f=
rom_compressed(buf, size, pos, &compressed_data);
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  587  		error =3D PTR_ERR(data=
);
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  588  	} else {
5ef50d014c5924 John Johansen 2017-01-16  589  		data =3D aa_simple_write_to=
_buffer(buf, size, size, pos);
63e2b423771ab0 John Johansen 2010-07-29 @590  		error =3D PTR_ERR(data);
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  591  	}
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  592 =20
63e2b423771ab0 John Johansen 2010-07-29  593  	if (!IS_ERR(data)) {
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  594  		error =3D aa_replace_p=
rofiles(ns, label, mask, data,
17b5758bf35c7a Maxime B=C3=A9lair 2024-02-01  595  					    compressed_data=
, size);
a0b7091c4de45a John Johansen 2026-02-24  596  		/* put pcount, which will p=
ut count and free if no
a0b7091c4de45a John Johansen 2026-02-24  597  		 * profiles referencing it.
a0b7091c4de45a John Johansen 2026-02-24  598  		 */
a0b7091c4de45a John Johansen 2026-02-24  599  		aa_put_profile_loaddata(dat=
a);
63e2b423771ab0 John Johansen 2010-07-29  600  	}
c6b39f070722ea Xiyu Yang     2020-04-20  601  end_section:
637f688dc3dc30 John Johansen 2017-06-09  602  	end_current_label_crit_secti=
on(label);
63e2b423771ab0 John Johansen 2010-07-29  603 =20
63e2b423771ab0 John Johansen 2010-07-29  604  	return error;
63e2b423771ab0 John Johansen 2010-07-29  605  }
63e2b423771ab0 John Johansen 2010-07-29  606 =20

:::::: The code at line 590 was first introduced by commit
:::::: 63e2b423771ab0bc7ad4d407f3f6517c6d05cdc0 AppArmor: userspace interfa=
ces

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
