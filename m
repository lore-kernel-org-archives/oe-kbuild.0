Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B08A35CB88
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476241; cv=none; b=azZ4bjlBy6PKxUH+J8xcA6nN3G6YTwawEkakKQL5y0IpkTufNRz9eWkJDdCCM6oWiQYSrJbXTvfeqbcyXml/ash9c03MYQZt+bgsKL5kNxizyTCjpDGwi70T0vzUfJOQOV9o0T8/cTz9ExSewdm8VBqoplC2yp3sdfxJu/aYpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476241; c=relaxed/simple;
	bh=TGwl8Hpkqfa7dTfknwCutRJQkmxQwCSwXXzHVlOMYAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XySvcmL/l3oSqkKNKy5A3iH4WQAeOSVXofxseQbv3ovUMIF5TswJbQ0KWXaBcwZTm46UIPKBMSu5sMYvaJmbnNBhjfWHr6O85VfNLeT0hGmAntBtayBkiDGeUXdlKhyagAozfgWzjcSs0BDIJwSPvalqfBjPIPvfunXDfGNQsog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbPSlvA3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbPSlvA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763476240; x=1795012240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGwl8Hpkqfa7dTfknwCutRJQkmxQwCSwXXzHVlOMYAE=;
  b=cbPSlvA3YP7nTnHNOY5ueTKj+YrQRmOPamoPRXYYn06Pl+AcnxvUGpCO
   mTWaIjoWondUOXfIoQ4ihd/alRf33FbhMCjEvdLVFtv3liTO84eGYtq97
   PiKV7k9Tfw+3cgwYdcVnfo8gSCkg2VxETeRUpKjKLpozxOqZLyLk3BwQV
   XU74tGJLkb5zgVTBGQHBskJMoZ5SL/wtsrK20s/ICWSkhc885jTXJ6KWC
   DkoQlcDuRue1W+oRW9PT2Xmv7BKHTxvrDFUJqz+tHPDBO2Q1eCimAcJtV
   r7F5zs785ydOynVRC+V7wuSnE8cO1qw3d/8WQtAKCQaR8eN19789cEc0i
   w==;
X-CSE-ConnectionGUID: LUjDv2DDQCab+DGM0twcEA==
X-CSE-MsgGUID: XmNNlyj9Tr295HMtAnkEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76101393"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76101393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:30:39 -0800
X-CSE-ConnectionGUID: TvJIm+3NRpWevJcVAgdYWg==
X-CSE-MsgGUID: mSwr8hUWRB2orpqXBKpyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="194883359"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2025 06:30:38 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLMj5-0001pZ-0j;
	Tue, 18 Nov 2025 14:30:35 +0000
Date: Tue, 18 Nov 2025 22:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/krb5/rfc8009_aes2.o: warning: objtool: sg_set_buf+0x5c:
 unreachable instruction
Message-ID: <202511182250.T6gVCOHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: 6c3c0e86c2acf53bf67c095c67335a0bec2a16af crypto/krb5: Implement the AES enctypes from rfc8009
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182250.T6gVCOHl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182250.T6gVCOHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511182250.T6gVCOHl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/krb5/rfc8009_aes2.o: warning: objtool: sg_set_buf+0x5c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
