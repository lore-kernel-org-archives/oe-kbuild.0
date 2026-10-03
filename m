Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C545484893
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044385; cv=none; b=WwdqQr6pr8UB+NArrHbuRAcBmYl4l/2opOZIN+ZkPToYucyaJaS45dgAiu8E3K4+zsuK74FDGnebWRO3xh0KS+1a/Vzo/SRZozexEkj6xwQiHwvkvUjfHCClIqqmZZSou/+M3TGoC3sj089f/0QmtwrvgVxODNRLOxnolnwznbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044385; c=relaxed/simple;
	bh=fW99X2TKGpzvD8auh49bgkSjgC4nOcC22PwaUspehSc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=VMCLDh5ImS/xdjCQuP7eU6POTZlV5Z0UMlpiCMLBdqrMmFc6olIP6LOU81qBPa4DkjjtOPPtFBptGOOCCfkb+HTE+ppwhuuCnquOe27jhtJtRXWehX/p3PXomWcFL5L8JDiJr1jRFDphHMK5PK6hYLhyqYewkZmX2L5B2hvHYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzMDPHKP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzMDPHKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791044382; x=1822580382;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fW99X2TKGpzvD8auh49bgkSjgC4nOcC22PwaUspehSc=;
  b=OzMDPHKPLtRWArT/LoNqo27fMvAnbDNIWoDeWrmJLfLC69mCfh6NYZJI
   lGxNkARe1QGGj+OC4aG3BkgBTXWCPauSNT8ya2Oj2qXqr2VTb+3XLUsoz
   siEzUZONXxl+GPOOG7x3v8KQlqHxRSeJXwMXGjUF3OmL+GvcoshP3rIWU
   S7juf6R4r3uFOdEsfsctOCUUGMQ4UBEiPT//qwGrJdUbq576DDNfjeZy7
   jsxP9rE4Cdq6itYkJ4lomf9H9oUFx+vnFMCPiM2359Xgby3BYzVZ+FZYb
   V6rRxSdLtjXDLmHWDzpnVUabR+RVhk0adbQlOATtTPOPx1ShK6OO6Bwag
   Q==;
X-CSE-ConnectionGUID: DjM4wOhtSamTu9L+n/H+Iw==
X-CSE-MsgGUID: 1HBzwzFETdynDm7yFX0TRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90677898"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90677898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 09:19:40 -0700
X-CSE-ConnectionGUID: eSNIYmtqSdyOIB6HYCNjjg==
X-CSE-MsgGUID: XfNPUbowRVaqQI9cXNpGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="274271502"
Received: from igk-lkp-server01.igk.intel.com (HELO 2bff737dfedc) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Oct 2026 09:19:40 -0700
Received: from kbuild by 2bff737dfedc with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD2SU-0000000003X-3FoW
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Oct 2026 16:19:34 +0000
Date: Sat, 03 Oct 2026 18:19:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 43/142] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202610031816.NbX9HBrI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "checkpatch report for netdev code"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 651fc18b5a8c3fa4dc39586a4f1aca0b9e2e11d8 [43/142] rtl81xxx: Hack in=
 SDIO.
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20261003/202610031816.N=
bX9HBrI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1592: FILE: drivers/net/wireless/realtek/rtl8xxxu/core.c:5567:
+	switch (queue) {
+		case TXDESC_QUEUE_BK:
+		case TXDESC_QUEUE_BE:
+		case TXDESC_QUEUE_VI:
+		case TXDESC_QUEUE_VO:
+		case TXDESC_QUEUE_BEACON:
+		case TXDESC_QUEUE_HIGH:
+		case TXDESC_QUEUE_MGNT:
+		case TXDESC_QUEUE_CMD:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
