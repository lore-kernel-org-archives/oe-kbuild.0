Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE92C36B045
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342917; cv=none; b=fo04leiiwUC4H39iTHSL/KIyiAj8hDRdyWsaMqauPPDr2JLOJ8WxeSg7kRROmTAa6hB/4TxI6gTyK8uWX6oethtiAUDufTy/dcQPBfYX2N9SirGx34DTs/MSvujIcyxkpA+9CfLG3D4KdoikgmHAfMpGcF5Z9oouXMgZe1PnHhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342917; c=relaxed/simple;
	bh=rZZMQZu+R7zMsOlPvl9P6SYM4ksKh3CWrkvONUfdxLk=;
	h=Date:From:To:Subject:Message-ID; b=um5VdgeOJZKuhAunnHl86DC80/ZyJ0YcT36Bb4pVwr2bIfcYsxGdGjLchICY2mi1SG0x7JDOjcoY5L7dIosTcihwqt4MoY1ZdR7Fdy6m+sYt436XdErWhziEHKoa8r8r7pGsSbVYf/R8hJu+1XLtpzUWkh6YgQmJDnPVvBmoptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhbS64G/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhbS64G/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771342916; x=1802878916;
  h=date:from:to:subject:message-id;
  bh=rZZMQZu+R7zMsOlPvl9P6SYM4ksKh3CWrkvONUfdxLk=;
  b=mhbS64G/iRu7HkuraPS0FxiLSdLRH1i57n/mof0Jhy9j33UtQ76zOpOC
   0iP+O2xeZDBB71ZFASfAKJcA1J3FsMFbCSTRFY70KI6pkqND7YiD2HlEQ
   NTOp2OucBz6VpxFzWyZHWRHCILinNk8Px9+uyONqwIaHsH8vyEgmQt4M5
   ZBavIm63OFUq0e1IQDLdPAzTD9+aNa6FugWWlJ+XAmNqr084OYo3dpoUv
   jNjGAEPL9CFWL/x3I+OtL+HHQDJKpDJQfmHhpE/eQjgW05wsOUdKH5EgO
   CiQKT7X/D/fEHZnkl6I6xqaf8dLHyNZtx6MrosqsIH+Gy9d8z8yXlxwtx
   A==;
X-CSE-ConnectionGUID: 2umPKZ0eQXuJtiTCS4zAEg==
X-CSE-MsgGUID: BQxrJDJjQT+boDIxaJog+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="75011843"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="75011843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 07:41:55 -0800
X-CSE-ConnectionGUID: Knyxur9DSiKnaL5mBcHXiQ==
X-CSE-MsgGUID: JkEHwDU2Suq0zi5n99eoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="217841413"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 07:41:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsNCy-0000000032H-2XXB
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Feb 2026 15:41:52 +0000
Date: Tue, 17 Feb 2026 16:40:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [openvpn-ovpn-net-next:development 13/14] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'any'
Message-ID: <202602171633.Ecv098UW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ralf Lici <ralf@mandelbit.com>

tree:   https://github.com/OpenVPN/ovpn-net-next development
head:   ef09f5c6b4a0ca167acdb573ba075008159652b4
commit: 870aca3f26ca114e213c7415fa2c4db803d0ceac [13/14] selftests: ovpn: add test for bound address
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260217/202602171633.Ecv098UW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'any'
#516: FILE: tools/testing/selftests/net/ovpn/test-bind.sh:105:
+	run_bind_test any any 10.10.10.2 10.10.10.1

WARNING:REPEATED_WORD: Possible repeated word: 'any'
#520: FILE: tools/testing/selftests/net/ovpn/test-bind.sh:109:
+	run_bind_test any any 20.20.20.2 20.20.20.1

WARNING:REPEATED_WORD: Possible repeated word: 'any'
#536: FILE: tools/testing/selftests/net/ovpn/test-mark.sh:29:
+ip netns exec peer0 ${OVPN_CLI} new_multi_peer tun0 any any 1 ${UDP_PEERS_FILE} ${MARK}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
