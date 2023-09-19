Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A6633D5
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695163222; x=1726699222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0f6tkH1xJsRLY1bY2Snc6pP8XAM39XtebMMLbUYDDc=;
  b=SdG7iQ2t6yBywhE8pgH4h8mAj9HJfJ/Hy74Eu2W8/bzziGVLMuvlkJC8
   Gx2xWnRx2oK1qLQFLR+myI1kM1++CVs0y+J29tn4wjSfIKBk6dgSjE0RZ
   FznZJgKjg+GhnB+WI5mF9pFq4WKcY59ctzuOBTk++Z8Yma5cracqira9N
   pE7mL3iUh0v8141Pa2Zmmi2hLUKTyjFSvglPjWw9tuiBh3kaW6zoMZ4pA
   LL5bJk94Mr/C+yYyJFn5fIvOaqX1lqBsXSF4te5yG1ZzVoy9+pwXd2vl3
   JCJ4emHYuh7UEntmkzmDUFBAHtFd78uM7js+E5MgzkLjXfkEcrvluY6/Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365118769"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="365118769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 15:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920035738"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="920035738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2023 15:40:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qijMe-00080K-1h;
	Tue, 19 Sep 2023 22:39:13 +0000
Date: Wed, 20 Sep 2023 06:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 bpf-next 02/13] bpf: add BPF token delegation mount
 options to BPF FS
Message-ID: <202309200632.7YokfzI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230919214800.3803828-3-andrii@kernel.org>
References: <20230919214800.3803828-3-andrii@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: bpf@vger.kernel.org
TO: netdev@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: keescook@chromium.org
CC: brauner@kernel.org
CC: lennart@poettering.net
CC: kernel-team@meta.com
CC: sargun@sargun.me

Hi Andrii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-align-CAP_NET_ADMIN-checks-with-bpf_capable-approach/20230920-055119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230919214800.3803828-3-andrii%40kernel.org
patch subject: [PATCH v5 bpf-next 02/13] bpf: add BPF token delegation mount options to BPF FS
:::::: branch date: 44 minutes ago
:::::: commit date: 44 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200632.7YokfzI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309200632.7YokfzI3-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
    a set of allowable BPF program types that could be loaded with BPF token;

WARNING: Prefer seq_puts to seq_printf
#119: kernel/bpf/inode.c:611:
+		seq_printf(m, ",delegate_cmds=any");

WARNING: Prefer seq_puts to seq_printf
#124: kernel/bpf/inode.c:616:
+		seq_printf(m, ",delegate_maps=any");

WARNING: Prefer seq_puts to seq_printf
#129: kernel/bpf/inode.c:621:
+		seq_printf(m, ",delegate_progs=any");

WARNING: Prefer seq_puts to seq_printf
#134: kernel/bpf/inode.c:626:
+		seq_printf(m, ",delegate_attachs=any");

WARNING: space prohibited between function name and open parenthesis '('
#152: kernel/bpf/inode.c:660:
+	fsparam_string	("delegate_cmds",		OPT_DELEGATE_CMDS),

WARNING: space prohibited between function name and open parenthesis '('
#153: kernel/bpf/inode.c:661:
+	fsparam_string	("delegate_maps",		OPT_DELEGATE_MAPS),

WARNING: space prohibited between function name and open parenthesis '('
#154: kernel/bpf/inode.c:662:
+	fsparam_string	("delegate_progs",		OPT_DELEGATE_PROGS),

WARNING: space prohibited between function name and open parenthesis '('
#155: kernel/bpf/inode.c:663:
+	fsparam_string	("delegate_attachs",		OPT_DELEGATE_ATTACHS),

ERROR: trailing statements should be on next line
#190: kernel/bpf/inode.c:708:
+		case OPT_DELEGATE_CMDS: opts->delegate_cmds |= msk; break;

ERROR: trailing statements should be on next line
#191: kernel/bpf/inode.c:709:
+		case OPT_DELEGATE_MAPS: opts->delegate_maps |= msk; break;

ERROR: trailing statements should be on next line
#192: kernel/bpf/inode.c:710:
+		case OPT_DELEGATE_PROGS: opts->delegate_progs |= msk; break;

ERROR: trailing statements should be on next line
#193: kernel/bpf/inode.c:711:
+		case OPT_DELEGATE_ATTACHS: opts->delegate_attachs |= msk; break;

WARNING: kfree(NULL) is safe and this check is probably not required
#224: kernel/bpf/inode.c:821:
+	if (opts)
+		kfree(opts);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
