Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047153DFC74
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870835; cv=none; b=U7Jb7xn1oRpPIZk7MCvdbaBqTLGOajjOBMk/FluECVeskVRVEMtonz8sPppkOGvJeNz9jYhM9c2ScingOMelGX0wCrLVuaY4qgATt7Vw3R6JmouxvoQ7E4WSgBwaa3bG9EItp+WmnYmC/8hvnBn6SOqJweNomqhH56Xq31ZNgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870835; c=relaxed/simple;
	bh=Q4ikFsisYvp2L6N2CTD1LExYSjetkrEy+evTpW/AJhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jKU0uKuLx8bD1zQhug/khosjGUKvKzvA/oqZqecmtL9qxqT5TZwR6sC0tfoSJzDPXY055A1Rsiz346EuA4u2DsLr6YXPYKoYgl+iDwmpllLD4k+1S1+GLYQCscpu9ZkCfL28FASUQ8x0eigsflguxkW+r8sP/GDUptkC7ol+xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCVHX8HJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCVHX8HJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779870831; x=1811406831;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q4ikFsisYvp2L6N2CTD1LExYSjetkrEy+evTpW/AJhM=;
  b=HCVHX8HJ5jL/0cgdZag6jV15U8CPF1FL6LBzeuxnG+69V/tC2swADioB
   2PAq+QlCHUjpkS3jKW2P2g5fEs9RBQ3rePBjgzxQveRJz/JBGtGnwpxJr
   Ti9Jk2YwZMwONulmcGO1pyY30lzmLE3DcHhxXKbe12EPP4zkd8nAQJjuj
   MtMvlueH1160CsRjbz/pIiiIb17cmwpAASDqsrmJa7RCgx8zHOP58EEqW
   p/1shnI3R/f/hKOjl7q4jf4zgs+xrGcOBSKkYeuMDTQoy9hSrTPNJ0NP0
   ATHR/GwgYi6jbKtqLsrcGlq2Q+TTBCx1eVVAe5pfZ8aydvh2RLmdoS0el
   A==;
X-CSE-ConnectionGUID: u7TsLsSbT166MZyVhpuo3A==
X-CSE-MsgGUID: MF2W9K0URQ2dGubVnBJ4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98117270"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="98117270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:33:43 -0700
X-CSE-ConnectionGUID: GbjK+ZgqQY+ovgAIUeacSA==
X-CSE-MsgGUID: Ljk4ZmeZRoS9/pEShsp8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241340283"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2026 01:33:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS9hr-000000003g0-0kLE;
	Wed, 27 May 2026 08:33:39 +0000
Date: Wed, 27 May 2026 16:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 407/8275]
 drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn: passing
 freed memory 'fence' (line 195)
Message-ID: <202605271632.zd7M2Tsq-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: 6055c9e333cfbb5af3eabe204caea92757094d19 [407/8275] dma-buf: Change=
 st-dma-fence-chain.c to use kunit
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20260526 (https://download.01.org/0day-ci/arc=
hive/20260527/202605271632.zd7M2Tsq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605271632.zd7M2Tsq-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn: passing fr=
eed memory 'fence' (line 195)
drivers/dma-buf/st-dma-fence-chain.c:266 test_find_signaled() error: derefe=
rencing freed memory 'fence' (line 259)
drivers/dma-buf/st-dma-fence-chain.c:307 test_find_out_of_order() error: de=
referencing freed memory 'fence' (line 293)
drivers/dma-buf/st-dma-fence-chain.c:339 test_find_gap() error: dereferenci=
ng freed memory 'fence' (line 332)
drivers/dma-buf/st-dma-fence-chain.c:346 test_find_gap() warn: passing free=
d memory 'fence' (line 332)

Old smatch warnings:
drivers/dma-buf/st-dma-fence-chain.c:219 test_find_seqno() warn: passing fr=
eed memory 'fence' (line 209)
drivers/dma-buf/st-dma-fence-chain.c:228 test_find_seqno() warn: passing fr=
eed memory 'fence' (line 221)

vim +/fence +207 drivers/dma-buf/st-dma-fence-chain.c

dc2f7e67a28a5c Chris Wilson      2020-04-09  173 =20
6055c9e333cfbb Jason Gunthorpe   2026-03-01  174  static void test_find_seq=
no(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  175  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  176  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  177  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  178  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  179  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  180 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  181  	err =3D fence_chains_ini=
t(&fc, 64, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  182  	KUNIT_ASSERT_EQ_MSG(test=
, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  183 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  184  	fence =3D dma_fence_get(=
fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  185  	err =3D dma_fence_chain_=
find_seqno(&fence, 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  186  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  187  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  188  		KUNIT_FAIL(test, "Repor=
ted %d for find_seqno(0)!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  189  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  190  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  191 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  192  	for (i =3D 0; i < fc.cha=
in_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  193  		fence =3D dma_fence_get=
(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  194  		err =3D dma_fence_chain=
_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @195  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  196  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  197  			KUNIT_FAIL(test, "Repo=
rted %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  198  				   err, fc.chain_leng=
th + 1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  199  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  200  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  201  		if (fence !=3D fc.chain=
s[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  202  			KUNIT_FAIL(test, "Inco=
rrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  203  				   fc.chain_length + =
1, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  204  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  205  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  206 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09 @207  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  208  		err =3D dma_fence_chain=
_find_seqno(&fence, i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  209  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  210  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  211  			KUNIT_FAIL(test, "Erro=
r reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  212  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  213  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  214  		if (fence !=3D fc.chain=
s[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  215  			KUNIT_FAIL(test, "Inco=
rrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  216  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  217  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  218 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  219  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  220  		err =3D dma_fence_chain=
_find_seqno(&fence, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  221  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  222  		if (!err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  223  			KUNIT_FAIL(test, "Erro=
r not reported for future fence: find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  224  				   i + 1, i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  225  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  226  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  227 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  228  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  229  		err =3D dma_fence_chain=
_find_seqno(&fence, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  230  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  231  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  232  			KUNIT_FAIL(test, "Erro=
r reported for previous fence!");
dc2f7e67a28a5c Chris Wilson      2020-04-09  233  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  234  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  235  		if (i > 0 && fence !=3D =
fc.chains[i - 1]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  236  			KUNIT_FAIL(test, "Inco=
rrect fence reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  237  				   i + 1, i);
dc2f7e67a28a5c Chris Wilson      2020-04-09  238  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  239  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  240  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  241 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  242  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  243  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  244  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  245 =20
6055c9e333cfbb Jason Gunthorpe   2026-03-01  246  static void test_find_sig=
naled(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  247  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  248  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  249  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  250  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  251 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  252  	err =3D fence_chains_ini=
t(&fc, 2, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  253  	KUNIT_ASSERT_EQ_MSG(test=
, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  254 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  255  	dma_fence_signal(fc.fenc=
es[0]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  256 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  257  	fence =3D dma_fence_get(=
fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  258  	err =3D dma_fence_chain_=
find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @259  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  260  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  261  		KUNIT_FAIL(test, "Repor=
ted %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  262  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  263  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  264 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  265  	if (fence && fence !=3D =
fc.chains[0]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01 @266  		KUNIT_FAIL(test, "Incor=
rect chain-fence.seqno:%lld reported for completed seqno:1",
dc2f7e67a28a5c Chris Wilson      2020-04-09  267  			   fence->seqno);
dc2f7e67a28a5c Chris Wilson      2020-04-09  268 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  269  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  270  		err =3D dma_fence_chain=
_find_seqno(&fence, 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  271  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  272  		if (err)
6055c9e333cfbb Jason Gunthorpe   2026-03-01  273  			KUNIT_FAIL(test, "Repo=
rted %d for finding self!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  274  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  275 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  276  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  277  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  278  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  279 =20
6055c9e333cfbb Jason Gunthorpe   2026-03-01  280  static void test_find_out=
_of_order(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  281  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  282  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  283  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  284  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  285 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  286  	err =3D fence_chains_ini=
t(&fc, 3, seqno_inc);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  287  	KUNIT_ASSERT_EQ_MSG(test=
, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  288 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  289  	dma_fence_signal(fc.fenc=
es[1]);
dc2f7e67a28a5c Chris Wilson      2020-04-09  290 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  291  	fence =3D dma_fence_get(=
fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  292  	err =3D dma_fence_chain_=
find_seqno(&fence, 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @293  	dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  294  	if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  295  		KUNIT_FAIL(test, "Repor=
ted %d for find_seqno()!", err);
dc2f7e67a28a5c Chris Wilson      2020-04-09  296  		goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  297  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  298 =20
4cca2e64164176 Lionel Landwerlin 2020-06-25  299  	/*
4cca2e64164176 Lionel Landwerlin 2020-06-25  300  	 * We signaled the middl=
e fence (2) of the 1-2-3 chain. The behavior
4cca2e64164176 Lionel Landwerlin 2020-06-25  301  	 * of the dma-fence-chai=
n is to make us wait for all the fences up to
4cca2e64164176 Lionel Landwerlin 2020-06-25  302  	 * the point we want. Si=
nce fence 1 is still not signaled, this what
4cca2e64164176 Lionel Landwerlin 2020-06-25  303  	 * we should get as fenc=
e to wait upon (fence 2 being garbage
4cca2e64164176 Lionel Landwerlin 2020-06-25  304  	 * collected during the =
traversal of the chain).
4cca2e64164176 Lionel Landwerlin 2020-06-25  305  	 */
6055c9e333cfbb Jason Gunthorpe   2026-03-01  306  	if (fence !=3D fc.chains=
[0])
6055c9e333cfbb Jason Gunthorpe   2026-03-01 @307  		KUNIT_FAIL(test, "Incor=
rect chain-fence.seqno:%lld reported for completed seqno:2",
4cca2e64164176 Lionel Landwerlin 2020-06-25  308  			   fence ? fence->seqn=
o : 0);
dc2f7e67a28a5c Chris Wilson      2020-04-09  309 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  310  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  311  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  312  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  313 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  314  static uint64_t seqno_inc=
2(unsigned int i)
dc2f7e67a28a5c Chris Wilson      2020-04-09  315  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  316  	return 2 * i + 2;
dc2f7e67a28a5c Chris Wilson      2020-04-09  317  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  318 =20
6055c9e333cfbb Jason Gunthorpe   2026-03-01  319  static void test_find_gap=
(struct kunit *test)
dc2f7e67a28a5c Chris Wilson      2020-04-09  320  {
dc2f7e67a28a5c Chris Wilson      2020-04-09  321  	struct fence_chains fc;
dc2f7e67a28a5c Chris Wilson      2020-04-09  322  	struct dma_fence *fence;
dc2f7e67a28a5c Chris Wilson      2020-04-09  323  	int err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  324  	int i;
dc2f7e67a28a5c Chris Wilson      2020-04-09  325 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  326  	err =3D fence_chains_ini=
t(&fc, 64, seqno_inc2);
6055c9e333cfbb Jason Gunthorpe   2026-03-01  327  	KUNIT_ASSERT_EQ_MSG(test=
, err, 0, "Failed to init fence chains");
dc2f7e67a28a5c Chris Wilson      2020-04-09  328 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  329  	for (i =3D 0; i < fc.cha=
in_length; i++) {
dc2f7e67a28a5c Chris Wilson      2020-04-09  330  		fence =3D dma_fence_get=
(fc.tail);
dc2f7e67a28a5c Chris Wilson      2020-04-09  331  		err =3D dma_fence_chain=
_find_seqno(&fence, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09 @332  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  333  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  334  			KUNIT_FAIL(test, "Repo=
rted %d for find_seqno(%d:%d)!",
dc2f7e67a28a5c Chris Wilson      2020-04-09  335  				   err, fc.chain_leng=
th + 1, 2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  336  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  337  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  338  		if (fence !=3D fc.chain=
s[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01 @339  			KUNIT_FAIL(test, "Inco=
rrect fence.seqno:%lld reported by find_seqno(%d:%d)",
dc2f7e67a28a5c Chris Wilson      2020-04-09  340  				   fence->seqno,
dc2f7e67a28a5c Chris Wilson      2020-04-09  341  				   fc.chain_length + =
1,
dc2f7e67a28a5c Chris Wilson      2020-04-09  342  				   2 * i + 1);
dc2f7e67a28a5c Chris Wilson      2020-04-09  343  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  344  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  345 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09 @346  		dma_fence_get(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  347  		err =3D dma_fence_chain=
_find_seqno(&fence, 2 * i + 2);
dc2f7e67a28a5c Chris Wilson      2020-04-09  348  		dma_fence_put(fence);
dc2f7e67a28a5c Chris Wilson      2020-04-09  349  		if (err) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  350  			KUNIT_FAIL(test, "Erro=
r reported for finding self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  351  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  352  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  353  		if (fence !=3D fc.chain=
s[i]) {
6055c9e333cfbb Jason Gunthorpe   2026-03-01  354  			KUNIT_FAIL(test, "Inco=
rrect fence reported by find self");
dc2f7e67a28a5c Chris Wilson      2020-04-09  355  			goto err;
dc2f7e67a28a5c Chris Wilson      2020-04-09  356  		}
dc2f7e67a28a5c Chris Wilson      2020-04-09  357  	}
dc2f7e67a28a5c Chris Wilson      2020-04-09  358 =20
dc2f7e67a28a5c Chris Wilson      2020-04-09  359  err:
dc2f7e67a28a5c Chris Wilson      2020-04-09  360  	fence_chains_fini(&fc);
dc2f7e67a28a5c Chris Wilson      2020-04-09  361  }
dc2f7e67a28a5c Chris Wilson      2020-04-09  362 =20

:::::: The code at line 207 was first introduced by commit
:::::: dc2f7e67a28a5cbe4ea905dafaa6903df670014a dma-buf: Exercise dma-fence=
-chain under selftests

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
