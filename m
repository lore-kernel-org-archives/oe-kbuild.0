Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9DD320A
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682022776; x=1713558776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yo2Cu/atjvwCrGUXWQ356selgnN2HL7YyfIdZM4N0XI=;
  b=bblcknGdIeAGaT441DEZldDYrIKjkRc4k910BPQAYNVbswVPtvB47AEu
   WnyExR7LdS05xYZUPyp97lTOWrv2E15qt/czCo/Kpy41uy0xh6NGkRWjb
   1hZhkIduUMkiLnjFadwluQngseGNjGqB4q6Tdl39jJ3CBXEjWU+wv+6gW
   N9rRQE18GtA76jetr0tNol1zNDxz9Nho//SlXlzPksA/nGaEeP6wTi0kQ
   hzh8JClO98kbPaO68yonwRaGmXFeadofw2J+gq62bTB8zMp9/C4dckTI/
   9JI+FY9n5QJrK7oXp9n+wf5NO7sXkEY6+R4yWZiUSTNNwriWvk5tIQ2Jd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326172477"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="326172477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 13:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685507087"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="685507087"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 13:32:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppaxZ-000g56-1R;
	Thu, 20 Apr 2023 20:32:53 +0000
Date: Fri, 21 Apr 2023 04:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4603/13289] sound/soc/codecs/cs35l45.c:805:9-34:
 WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
 (unless it is nested IRQ)
Message-ID: <202304210420.aiOJEYA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44bf136283e567b2b62653be7630e7511da41da2
commit: 6085f9e6dc1973cf98ee7f5dcf629939e50f1b84 [4603/13289] ASoC: cs35l45: IRQ support
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: microblaze-randconfig-c44-20230419 (https://download.01.org/0day-ci/archive/20230421/202304210420.aiOJEYA3-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304210420.aiOJEYA3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs35l45.c:805:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
