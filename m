Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA99B3806A7
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934083; cv=none; b=ZaPMA6msqIYKExLUG1Wz8yKhyMZZE1vY7TbGcWfjpFMtdZdJqolrMV+y3qaliOntU8X56drO/v1eIfL8HW+HMXX1AU61TewYmpZ7jzGvs5tF9IUckSowMRRmpgZAuXe5OA+9oGNDnG/GK5GNNsEd7MKR6j/KCDGttK00effcFsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934083; c=relaxed/simple;
	bh=oZN60KHHZOQCkF+Af/kqWieCQNd+PVrqtcL3ggreXPs=;
	h=Date:From:To:Subject:Message-ID; b=f6jf6kw4dEoeKKWxeJ2HBiqGPFE3RNlCt935j9YqqPFmKr3zV7KO8eLZBWk1u/54plVEIxFluEmzFPr3N3jiNcjy0DlrFmWiiAkyuGDEg20Rm76QcnRw9Az0P18Wt5fH90mzYQSut2+yvX84wDK3U7DzbAFHwaTgQez2rTTq9jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtUg6qRI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtUg6qRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771934082; x=1803470082;
  h=date:from:to:subject:message-id;
  bh=oZN60KHHZOQCkF+Af/kqWieCQNd+PVrqtcL3ggreXPs=;
  b=LtUg6qRI9j3MVNetMGZAdurQ1BJ5giPgViPXVps5Ya7UMG67usVHuWkk
   cuNBiTDyItB4sw3paoeXXXez8yce0WipQUHE5Lc4n2651cev1+CKKDjh2
   xzhSIDy7KS3b4nnUgOY40FBaJCGhx6RZki6vdRL6vrm3QMvPOotw2Qr80
   ULOOhPaSyBOEfXZShYnjUyImveoxbJ31c27YZXPwrz6IHLTGbR8J4vcuS
   NvleAiSkFZxqsYXkuWC/sLRv4Hsoxa3bJWOHR31MiTwmhgTZ/+nIArP+n
   dzbDkXXikqFUVnD+yWt9R8k10RmUXJFGuTe5+N0WxjZXM6KyAUS5egT2D
   A==;
X-CSE-ConnectionGUID: /4LXoqVWSjS9R7oEFo+6tw==
X-CSE-MsgGUID: n0ZV7s5ARrqYVbtC/0v6xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72849675"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72849675"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 03:54:42 -0800
X-CSE-ConnectionGUID: nfhn1PN7S1GjrPhOvVac3A==
X-CSE-MsgGUID: Y4oXda4VRyuCd4KYp7Dg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214238656"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2026 03:54:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuqzu-000000005Dr-32Ph
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 11:54:38 +0000
Date: Tue, 24 Feb 2026 12:53:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 138/733] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202602241236.tvAxmKS2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: da8711d957708e3b41f4adedc95bcff9230f6615 [138/733] yenta_socket: copy pccard core code into driver
:::::: branch date: 2 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241236.tvAxmKS2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#4405: FILE: drivers/pcmcia/yenta_socket.c:2387:
+	events = (cb_event & (CB_CD1EVENT | CB_CD2EVENT)) ? SS_DETECT : 0 ;

WARNING:REPEATED_WORD: Possible repeated word: 'Zoom'
#4903: FILE: drivers/pcmcia/yenta_socket.c:2885:
+		/* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

WARNING:REPEATED_WORD: Possible repeated word: 'zoom'
#4903: FILE: drivers/pcmcia/yenta_socket.c:2885:
+		/* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

WARNING:REPEATED_WORD: Possible repeated word: 'zoom'
#4903: FILE: drivers/pcmcia/yenta_socket.c:2885:
+		/* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

ERROR:SPACING: space required before the open parenthesis '('
#4930: FILE: drivers/pcmcia/yenta_socket.c:2912:
+	if(PCI_FUNC(socket->dev->devfn)==1)

ERROR:SPACING: space required before the open parenthesis '('
#4933: FILE: drivers/pcmcia/yenta_socket.c:2915:
+	if(onoff)

ERROR:SPACING: space required before the open parenthesis '('
#4951: FILE: drivers/pcmcia/yenta_socket.c:2933:
+	if(socket->dev->vendor == PCI_VENDOR_ID_TI)

ERROR:SPACING: space required before the open parenthesis '('
#4953: FILE: drivers/pcmcia/yenta_socket.c:2935:
+		switch(socket->dev->device)

WARNING:REPEATED_WORD: Possible repeated word: 'both'
#5682: FILE: drivers/pcmcia/yenta_socket.c:3433:
+	 * interrupts for both both slots on 2-slot controllers

WARNING:REPEATED_WORD: Possible repeated word: 'Zoom'
#6036: FILE: drivers/pcmcia/yenta_socket.c:3721:
+                /* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

WARNING:REPEATED_WORD: Possible repeated word: 'zoom'
#6036: FILE: drivers/pcmcia/yenta_socket.c:3721:
+                /* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

WARNING:REPEATED_WORD: Possible repeated word: 'zoom'
#6036: FILE: drivers/pcmcia/yenta_socket.c:3721:
+                /* Zoom zoom, we will all go together, zoom zoom, zoom zoom */

ERROR:SPACING: space required before the open parenthesis '('
#6048: FILE: drivers/pcmcia/yenta_socket.c:3731:
+        if(socket->dev->vendor == PCI_VENDOR_ID_RICOH)

ERROR:SPACING: space required before the open parenthesis '('
#6050: FILE: drivers/pcmcia/yenta_socket.c:3733:
+                switch(socket->dev->device)

ERROR:SPACING: space required before the open parenthesis '('
#6147: FILE: drivers/pcmcia/yenta_socket.c:3804:
+	if(socket->dev->device < PCI_DEVICE_ID_RICOH_RL5C475) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
