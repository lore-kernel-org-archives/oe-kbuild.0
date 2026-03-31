Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EE3FFAAA
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978413; cv=none; b=To1nLJUbsru10f5I4ZVCdNeiMbq7Pd5bTAq88gcfMo+kI/5Ojyv9fPr8XMbzAotoF+Vo6MhHHshivWmv68lNEyzlhH5XRCWQMMHCW62v04ob5hH3masciSl0BbD0rJpSNsz7SGpMQPSzZMfFCAvK7ALhbl6TG/X5b4LdyrqWu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978413; c=relaxed/simple;
	bh=1R84JpKQ62Udgy3YvBGK7S/46EwV2QMSiEVwm+HYnUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CbE83RD+HHXVu6J2AP4ef/dGc0te8tbmf2el5AGJ6sjoG2OPJc1jCGyj/Jebo1QdfoJcLwdDAMj2RhMtnuhyqfUhvJjFdHBRKwyvbmcxvs5158yXXg6cskSKvLaVCrua2Eq9mz5PHCcCRIfu9G+LiMteiaiLPdndCweXPL/b7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8nXpxVG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8nXpxVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774978411; x=1806514411;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1R84JpKQ62Udgy3YvBGK7S/46EwV2QMSiEVwm+HYnUg=;
  b=W8nXpxVG4QfwPHQbHlzIxxEywdadwqCwyIsDDPVFx9DMPbFAP3yoZ36u
   IuWgaozWwVfLTGqkY8gac32wrjY6g9wRiZSnpZKvdLwT2ggSXNJFR0QeZ
   YAo22ziimR/e30e9cLhQv5wkPz904PSXkfSvZ/JT3+IxVDp9MsWGDE025
   dJTVSo44icQriKf8OtMEFQ4uou3pj3CgR+PIX8wrImrxZ+11FrWf6PnOP
   CNH6m7g7qlY6m9+fYsd8TnF3u0JQqv+Hq8OVyTlJ3ENbXXGc9P1FeBCX3
   44s5LYp7C5ZR044EGTcOB7pCUX7QabOFVPHdd8/DcdTG/o0OjtT/kiXCO
   g==;
X-CSE-ConnectionGUID: APHgmEZvRgO8/Io6YU5cng==
X-CSE-MsgGUID: 5ghF0EklRauaAZTLhzcO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98610680"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98610680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:33:29 -0700
X-CSE-ConnectionGUID: mwlcX8fER126y7DOWfvmxA==
X-CSE-MsgGUID: N1U7zJ0wSNmnfwuHTweVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226677294"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 10:33:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7cxw-000000003wr-0pw1;
	Tue, 31 Mar 2026 17:33:24 +0000
Date: Wed, 01 Apr 2026 01:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/target/iscsi/iscsi_target_auth.c:503
 chap_server_compute_hash() error: memcmp() 'chap->challenge' too small (32 vs
 1024)
Message-ID: <202604010124.9PcL3uHe-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: d70da12453ac3797e0c54884305ccc894e8c817b hardening: Enable i386 FOR=
TIFY_SOURCE on Clang 16+
date:   1 year, 1 month ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20260330 (https://download.01.org/0day-ci/archi=
ve/20260401/202604010124.9PcL3uHe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604010124.9PcL3uHe-lkp@intel.com/

smatch warnings:
drivers/target/iscsi/iscsi_target_auth.c:503 chap_server_compute_hash() err=
or: memcmp() 'chap->challenge' too small (32 vs 1024)

vim +503 drivers/target/iscsi/iscsi_target_auth.c

1e5733883421495 Dmitry Bogdanov    2022-07-18  239 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  240  static int chap_server_=
compute_hash(
be36d683fc29e74 Max Gurtovoy       2022-04-28  241  	struct iscsit_conn *co=
nn,
e48354ce078c079 Nicholas Bellinger 2011-07-23  242  	struct iscsi_node_auth=
 *auth,
e48354ce078c079 Nicholas Bellinger 2011-07-23  243  	char *nr_in_ptr,
e48354ce078c079 Nicholas Bellinger 2011-07-23  244  	char *nr_out_ptr,
e48354ce078c079 Nicholas Bellinger 2011-07-23  245  	unsigned int *nr_out_l=
en)
e48354ce078c079 Nicholas Bellinger 2011-07-23  246  {
bc704fb58f507de Nicholas Bellinger 2011-11-28  247  	unsigned long id;
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  248  	unsigned char id_as_uc=
har;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  249  	unsigned char type;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  250  	unsigned char identifi=
er[10], *initiatorchg =3D NULL;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  251  	unsigned char *initiat=
orchg_binhex =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  252  	unsigned char *digest =
=3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  253  	unsigned char *respons=
e =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  254  	unsigned char *client_=
digest =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  255  	unsigned char *server_=
digest =3D NULL;
e48354ce078c079 Nicholas Bellinger 2011-07-23  256  	unsigned char chap_n[M=
AX_CHAP_N_SIZE], chap_r[MAX_RESPONSE_LENGTH];
86784c6bdeeef78 Eric Seppanen      2013-11-20  257  	size_t compare_len;
8359cf43b9dccdd J=C3=B6rn Engel         2011-11-24  258  	struct iscsi_chap=
 *chap =3D conn->auth_protocol;
69110e3cedbb8aa Herbert Xu         2016-01-24  259  	struct crypto_shash *t=
fm =3D NULL;
69110e3cedbb8aa Herbert Xu         2016-01-24  260  	struct shash_desc *des=
c =3D NULL;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  261  	int auth_ret =3D -1, r=
et, initiatorchg_len;
e48354ce078c079 Nicholas Bellinger 2011-07-23  262 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  263  	digest =3D kzalloc(cha=
p->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  264  	if (!digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  265  		pr_err("Unable to all=
ocate the digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  266  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  267  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  268 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  269  	response =3D kzalloc(c=
hap->digest_size * 2 + 2, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  270  	if (!response) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  271  		pr_err("Unable to all=
ocate the response buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  272  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  273  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  274 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  275  	client_digest =3D kzal=
loc(chap->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  276  	if (!client_digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  277  		pr_err("Unable to all=
ocate the client_digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  278  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  279  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  280 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  281  	server_digest =3D kzal=
loc(chap->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  282  	if (!server_digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  283  		pr_err("Unable to all=
ocate the server_digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  284  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  285  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  286 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  287  	memset(identifier, 0, =
10);
e48354ce078c079 Nicholas Bellinger 2011-07-23  288  	memset(chap_n, 0, MAX_=
CHAP_N_SIZE);
e48354ce078c079 Nicholas Bellinger 2011-07-23  289  	memset(chap_r, 0, MAX_=
RESPONSE_LENGTH);
e48354ce078c079 Nicholas Bellinger 2011-07-23  290 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  291  	initiatorchg =3D kzall=
oc(CHAP_CHALLENGE_STR_LEN, GFP_KERNEL);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  292  	if (!initiatorchg) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  293  		pr_err("Unable to all=
ocate challenge buffer\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  294  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  295  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  296 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  297  	initiatorchg_binhex =
=3D kzalloc(CHAP_CHALLENGE_STR_LEN, GFP_KERNEL);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  298  	if (!initiatorchg_binh=
ex) {
f9fab3d9860050e Maurizio Lombardi  2019-10-17  299  		pr_err("Unable to all=
ocate initiatorchg_binhex buffer\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  300  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  301  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  302  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  303  	 * Extract CHAP_N.
e48354ce078c079 Nicholas Bellinger 2011-07-23  304  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  305  	if (extract_param(nr_i=
n_ptr, "CHAP_N", MAX_CHAP_N_SIZE, chap_n,
e48354ce078c079 Nicholas Bellinger 2011-07-23  306  				&type) < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  307  		pr_err("Could not fin=
d CHAP_N.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  308  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  309  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  310  	if (type =3D=3D HEX) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  311  		pr_err("Could not fin=
d CHAP_N.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  312  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  313  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  314 =20
86784c6bdeeef78 Eric Seppanen      2013-11-20  315  	/* Include the termina=
ting NULL in the compare */
86784c6bdeeef78 Eric Seppanen      2013-11-20  316  	compare_len =3D strlen=
(auth->userid) + 1;
86784c6bdeeef78 Eric Seppanen      2013-11-20  317  	if (strncmp(chap_n, au=
th->userid, compare_len) !=3D 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  318  		pr_err("CHAP_N values=
 do not match!\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  319  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  320  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  321  	pr_debug("[server] Got=
 CHAP_N=3D%s\n", chap_n);
e48354ce078c079 Nicholas Bellinger 2011-07-23  322  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  323  	 * Extract CHAP_R.
e48354ce078c079 Nicholas Bellinger 2011-07-23  324  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  325  	if (extract_param(nr_i=
n_ptr, "CHAP_R", MAX_RESPONSE_LENGTH, chap_r,
e48354ce078c079 Nicholas Bellinger 2011-07-23  326  				&type) < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  327  		pr_err("Could not fin=
d CHAP_R.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  328  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  329  	}
1e5733883421495 Dmitry Bogdanov    2022-07-18  330 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  331  	switch (type) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  332  	case HEX:
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  333  		if (strlen(chap_r) !=
=3D chap->digest_size * 2) {
1816494330a83f2 Vincent Pelletier  2018-09-09  334  			pr_err("Malformed CH=
AP_R\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  335  			goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  336  		}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  337  		if (hex2bin(client_di=
gest, chap_r, chap->digest_size) < 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  338  			pr_err("Malformed CH=
AP_R: invalid HEX\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  339  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  340  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  341  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  342  	case BASE64:
1e5733883421495 Dmitry Bogdanov    2022-07-18  343  		if (chap_base64_decod=
e(client_digest, chap_r, strlen(chap_r)) !=3D
1e5733883421495 Dmitry Bogdanov    2022-07-18  344  		    chap->digest_size=
) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  345  			pr_err("Malformed CH=
AP_R: invalid BASE64\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  346  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  347  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  348  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  349  	default:
1e5733883421495 Dmitry Bogdanov    2022-07-18  350  		pr_err("Could not fin=
d CHAP_R\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  351  		goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  352  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  353 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  354  	pr_debug("[server] Got=
 CHAP_R=3D%s\n", chap_r);
e48354ce078c079 Nicholas Bellinger 2011-07-23  355 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  356  	tfm =3D crypto_alloc_s=
hash(chap->digest_name, 0, 0);
e48354ce078c079 Nicholas Bellinger 2011-07-23  357  	if (IS_ERR(tfm)) {
69110e3cedbb8aa Herbert Xu         2016-01-24  358  		tfm =3D NULL;
69110e3cedbb8aa Herbert Xu         2016-01-24  359  		pr_err("Unable to all=
ocate struct crypto_shash\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  360  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  361  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  362 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  363  	desc =3D kmalloc(sizeo=
f(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
69110e3cedbb8aa Herbert Xu         2016-01-24  364  	if (!desc) {
69110e3cedbb8aa Herbert Xu         2016-01-24  365  		pr_err("Unable to all=
ocate struct shash_desc\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  366  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  367  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  368 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  369  	desc->tfm =3D tfm;
69110e3cedbb8aa Herbert Xu         2016-01-24  370 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  371  	ret =3D crypto_shash_i=
nit(desc);
e48354ce078c079 Nicholas Bellinger 2011-07-23  372  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  373  		pr_err("crypto_shash_=
init() failed\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  374  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  375  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  376 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  377  	ret =3D crypto_shash_u=
pdate(desc, &chap->id, 1);
e48354ce078c079 Nicholas Bellinger 2011-07-23  378  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  379  		pr_err("crypto_shash_=
update() failed for id\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  380  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  381  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  382 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  383  	ret =3D crypto_shash_u=
pdate(desc, (char *)&auth->password,
69110e3cedbb8aa Herbert Xu         2016-01-24  384  				  strlen(auth->pass=
word));
e48354ce078c079 Nicholas Bellinger 2011-07-23  385  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  386  		pr_err("crypto_shash_=
update() failed for password\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  387  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  388  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  389 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  390  	ret =3D crypto_shash_f=
inup(desc, chap->challenge,
19f5f88ed779180 Maurizio Lombardi  2019-10-17  391  				 chap->challenge_le=
n, server_digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  392  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  393  		pr_err("crypto_shash_=
finup() failed for challenge\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  394  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  395  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  396 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  397  	bin2hex(response, serv=
er_digest, chap->digest_size);
19f5f88ed779180 Maurizio Lombardi  2019-10-17  398  	pr_debug("[server] %s =
Server Digest: %s\n",
19f5f88ed779180 Maurizio Lombardi  2019-10-17  399  		chap->digest_name, re=
sponse);
e48354ce078c079 Nicholas Bellinger 2011-07-23  400 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  401  	if (memcmp(server_dige=
st, client_digest, chap->digest_size) !=3D 0) {
19f5f88ed779180 Maurizio Lombardi  2019-10-17  402  		pr_debug("[server] %s=
 Digests do not match!\n\n",
19f5f88ed779180 Maurizio Lombardi  2019-10-17  403  			chap->digest_name);
e48354ce078c079 Nicholas Bellinger 2011-07-23  404  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  405  	} else
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  406  		pr_debug("[server] %s=
 Digests match, CHAP connection"
19f5f88ed779180 Maurizio Lombardi  2019-10-17  407  				" successful.\n\n",=
 chap->digest_name);
e48354ce078c079 Nicholas Bellinger 2011-07-23  408  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  409  	 * One way authenticat=
ion has succeeded, return now if mutual
e48354ce078c079 Nicholas Bellinger 2011-07-23  410  	 * authentication is n=
ot enabled.
e48354ce078c079 Nicholas Bellinger 2011-07-23  411  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  412  	if (!auth->authenticat=
e_target) {
69110e3cedbb8aa Herbert Xu         2016-01-24  413  		auth_ret =3D 0;
69110e3cedbb8aa Herbert Xu         2016-01-24  414  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  415  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  416  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  417  	 * Get CHAP_I.
e48354ce078c079 Nicholas Bellinger 2011-07-23  418  	 */
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  419  	ret =3D extract_param(=
nr_in_ptr, "CHAP_I", 10, identifier, &type);
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  420  	if (ret =3D=3D -ENOENT=
) {
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  421  		pr_debug("Could not f=
ind CHAP_I. Initiator uses One way authentication.\n");
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  422  		auth_ret =3D 0;
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  423  		goto out;
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  424  	}
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  425  	if (ret < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  426  		pr_err("Could not fin=
d CHAP_I.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  427  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  428  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  429 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  430  	if (type =3D=3D HEX)
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  431  		ret =3D kstrtoul(&ide=
ntifier[2], 0, &id);
e48354ce078c079 Nicholas Bellinger 2011-07-23  432  	else
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  433  		ret =3D kstrtoul(iden=
tifier, 0, &id);
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  434 =20
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  435  	if (ret < 0) {
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  436  		pr_err("kstrtoul() fa=
iled for CHAP identifier: %d\n", ret);
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  437  		goto out;
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  438  	}
bc704fb58f507de Nicholas Bellinger 2011-11-28  439  	if (id > 255) {
bc704fb58f507de Nicholas Bellinger 2011-11-28  440  		pr_err("chap identifi=
er: %lu greater than 255\n", id);
bc704fb58f507de Nicholas Bellinger 2011-11-28  441  		goto out;
bc704fb58f507de Nicholas Bellinger 2011-11-28  442  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  443  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  444  	 * RFC 1994 says Ident=
ifier is no more than octet (8 bits).
e48354ce078c079 Nicholas Bellinger 2011-07-23  445  	 */
bc704fb58f507de Nicholas Bellinger 2011-11-28  446  	pr_debug("[server] Got=
 CHAP_I=3D%lu\n", id);
e48354ce078c079 Nicholas Bellinger 2011-07-23  447  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  448  	 * Get CHAP_C.
e48354ce078c079 Nicholas Bellinger 2011-07-23  449  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  450  	if (extract_param(nr_i=
n_ptr, "CHAP_C", CHAP_CHALLENGE_STR_LEN,
f9fab3d9860050e Maurizio Lombardi  2019-10-17  451  			initiatorchg, &type)=
 < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  452  		pr_err("Could not fin=
d CHAP_C.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  453  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  454  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  455 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  456  	switch (type) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  457  	case HEX:
1e5733883421495 Dmitry Bogdanov    2022-07-18  458  		initiatorchg_len =3D =
DIV_ROUND_UP(strlen(initiatorchg), 2);
1e5733883421495 Dmitry Bogdanov    2022-07-18  459  		if (!initiatorchg_len=
) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  460  			pr_err("Unable to co=
nvert incoming challenge\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  461  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  462  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  463  		if (initiatorchg_len =
> 1024) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  464  			pr_err("CHAP_C excee=
ds maximum binary size of 1024 bytes\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  465  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  466  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  467 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  468  		if (hex2bin(initiator=
chg_binhex, initiatorchg,
1e5733883421495 Dmitry Bogdanov    2022-07-18  469  			    initiatorchg_len=
) < 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  470  			pr_err("Malformed CH=
AP_C: invalid HEX\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  471  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  472  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  473  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  474  	case BASE64:
1e5733883421495 Dmitry Bogdanov    2022-07-18  475  		initiatorchg_len =3D =
chap_base64_decode(initiatorchg_binhex,
1e5733883421495 Dmitry Bogdanov    2022-07-18  476  						      initiatorch=
g,
1e5733883421495 Dmitry Bogdanov    2022-07-18  477  						      strlen(init=
iatorchg));
1e5733883421495 Dmitry Bogdanov    2022-07-18  478  		if (initiatorchg_len =
< 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  479  			pr_err("Malformed CH=
AP_C: invalid BASE64\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  480  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  481  		}
f9fab3d9860050e Maurizio Lombardi  2019-10-17  482  		if (!initiatorchg_len=
) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  483  			pr_err("Unable to co=
nvert incoming challenge\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  484  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  485  		}
f9fab3d9860050e Maurizio Lombardi  2019-10-17  486  		if (initiatorchg_len =
> 1024) {
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  487  			pr_err("CHAP_C excee=
ds maximum binary size of 1024 bytes\n");
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  488  			goto out;
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  489  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  490  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  491  	default:
1e5733883421495 Dmitry Bogdanov    2022-07-18  492  		pr_err("Could not fin=
d CHAP_C.\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  493  		goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  494  	}
1e5733883421495 Dmitry Bogdanov    2022-07-18  495 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  496  	pr_debug("[server] Got=
 CHAP_C=3D%s\n", initiatorchg);
1d2b60a5545942b Nicholas Bellinger 2014-06-05  497  	/*
1d2b60a5545942b Nicholas Bellinger 2014-06-05  498  	 * During mutual authe=
ntication, the CHAP_C generated by the
1d2b60a5545942b Nicholas Bellinger 2014-06-05  499  	 * initiator must not =
match the original CHAP_C generated by
1d2b60a5545942b Nicholas Bellinger 2014-06-05  500  	 * the target.
1d2b60a5545942b Nicholas Bellinger 2014-06-05  501  	 */
f9fab3d9860050e Maurizio Lombardi  2019-10-17  502  	if (initiatorchg_len =
=3D=3D chap->challenge_len &&
f9fab3d9860050e Maurizio Lombardi  2019-10-17 @503  				!memcmp(initiatorch=
g_binhex, chap->challenge,
f9fab3d9860050e Maurizio Lombardi  2019-10-17  504  				initiatorchg_len)) {
1d2b60a5545942b Nicholas Bellinger 2014-06-05  505  		pr_err("initiator CHA=
P_C matches target CHAP_C, failing"
1d2b60a5545942b Nicholas Bellinger 2014-06-05  506  		       " login attemp=
t\n");
1d2b60a5545942b Nicholas Bellinger 2014-06-05  507  		goto out;
1d2b60a5545942b Nicholas Bellinger 2014-06-05  508  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  509  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  510  	 * Generate CHAP_N and=
 CHAP_R for mutual authentication.
e48354ce078c079 Nicholas Bellinger 2011-07-23  511  	 */
69110e3cedbb8aa Herbert Xu         2016-01-24  512  	ret =3D crypto_shash_i=
nit(desc);
e48354ce078c079 Nicholas Bellinger 2011-07-23  513  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  514  		pr_err("crypto_shash_=
init() failed\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  515  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  516  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  517 =20
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  518  	/* To handle both endi=
annesses */
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  519  	id_as_uchar =3D id;
69110e3cedbb8aa Herbert Xu         2016-01-24  520  	ret =3D crypto_shash_u=
pdate(desc, &id_as_uchar, 1);
e48354ce078c079 Nicholas Bellinger 2011-07-23  521  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  522  		pr_err("crypto_shash_=
update() failed for id\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  523  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  524  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  525 =20
69110e3cedbb8aa Herbert Xu         2016-01-24  526  	ret =3D crypto_shash_u=
pdate(desc, auth->password_mutual,
e48354ce078c079 Nicholas Bellinger 2011-07-23  527  				  strlen(auth->pass=
word_mutual));
e48354ce078c079 Nicholas Bellinger 2011-07-23  528  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  529  		pr_err("crypto_shash_=
update() failed for"
e48354ce078c079 Nicholas Bellinger 2011-07-23  530  				" password_mutual\n=
");
e48354ce078c079 Nicholas Bellinger 2011-07-23  531  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  532  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  533  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  534  	 * Convert received ch=
allenge to binary hex.
e48354ce078c079 Nicholas Bellinger 2011-07-23  535  	 */
f9fab3d9860050e Maurizio Lombardi  2019-10-17  536  	ret =3D crypto_shash_f=
inup(desc, initiatorchg_binhex, initiatorchg_len,
69110e3cedbb8aa Herbert Xu         2016-01-24  537  				 digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  538  	if (ret < 0) {
69110e3cedbb8aa Herbert Xu         2016-01-24  539  		pr_err("crypto_shash_=
finup() failed for ma challenge\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  540  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  541  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  542 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  543  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  544  	 * Generate CHAP_N and=
 CHAP_R.
e48354ce078c079 Nicholas Bellinger 2011-07-23  545  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  546  	*nr_out_len =3D sprint=
f(nr_out_ptr, "CHAP_N=3D%s", auth->userid_mutual);
e48354ce078c079 Nicholas Bellinger 2011-07-23  547  	*nr_out_len +=3D 1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  548  	pr_debug("[server] Sen=
ding CHAP_N=3D%s\n", auth->userid_mutual);
e48354ce078c079 Nicholas Bellinger 2011-07-23  549  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  550  	 * Convert response fr=
om binary hex to ascii hext.
e48354ce078c079 Nicholas Bellinger 2011-07-23  551  	 */
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  552  	bin2hex(response, dige=
st, chap->digest_size);
e48354ce078c079 Nicholas Bellinger 2011-07-23  553  	*nr_out_len +=3D sprin=
tf(nr_out_ptr + *nr_out_len, "CHAP_R=3D0x%s",
e48354ce078c079 Nicholas Bellinger 2011-07-23  554  			response);
e48354ce078c079 Nicholas Bellinger 2011-07-23  555  	*nr_out_len +=3D 1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  556  	pr_debug("[server] Sen=
ding CHAP_R=3D0x%s\n", response);
e48354ce078c079 Nicholas Bellinger 2011-07-23  557  	auth_ret =3D 0;
e48354ce078c079 Nicholas Bellinger 2011-07-23  558  out:
453431a54934d91 Waiman Long        2020-08-06  559  	kfree_sensitive(desc);
ce512d79d0466a6 David Disseldorp   2017-12-13  560  	if (tfm)
69110e3cedbb8aa Herbert Xu         2016-01-24  561  		crypto_free_shash(tfm=
);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  562  	kfree(initiatorchg);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  563  	kfree(initiatorchg_bin=
hex);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  564  	kfree(digest);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  565  	kfree(response);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  566  	kfree(server_digest);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  567  	kfree(client_digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  568  	return auth_ret;
e48354ce078c079 Nicholas Bellinger 2011-07-23  569  }
e48354ce078c079 Nicholas Bellinger 2011-07-23  570 =20

:::::: The code at line 503 was first introduced by commit
:::::: f9fab3d9860050ed69b7cee348a449a7853a3259 scsi: target: iscsi: rename=
 some variables to avoid confusion.

:::::: TO: Maurizio Lombardi <mlombard@redhat.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
