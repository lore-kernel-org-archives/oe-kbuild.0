Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176023AA;
	Tue,  7 Feb 2023 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675769654; x=1707305654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iM5qO4CG5jAPRqSED8elvGm0pTr4zMaZLanDO/W3M7w=;
  b=JCX4UkFEmjhv5hPNTAiO0gzMNcqqmXpx/Es0BHXqjQmp3gw0t7zClVz4
   DCqDXD4TpcTtgQsA92EBmbavMd4vEYuOufOm5+udPC55/t4mDtuK0TpQ8
   MeUUxYdNDBgdnt1hk4a9AGPMpT12Nf8S8rxlJLHuJxTLf0XyWTf/GegM0
   RpKI5LyQ2TO1t0bascNhbwJL/t85DJYQizJyVJu9sY1rfuS8REVbwigol
   iYlDD/M6/aOTBx1Gy9CCKvmn6uRDRtiAu+QOO2qYLbdVC8kpVezKG/1Gh
   G1mosBCo/0ovKw2j5nYI06Sx6v+5/mZiT+mKDHwzs35UcTkkCq3lxOSaS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="313130526"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313130526"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:34:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="616783684"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="616783684"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144]) ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:34:11 -0800
Message-ID: <c4ca7725-4db1-76d1-ba74-a1d17102bbeb@linux.intel.com>
Date: Tue, 7 Feb 2023 12:34:09 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: sound/soc/soc-topology.c:1405 soc_tplg_dapm_widget_create() warn:
 missing error code 'ret'
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <202302071823.2veEqSHM-lkp@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <202302071823.2veEqSHM-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/2023 11:08 AM, Dan Carpenter wrote:
> Hi Amadeusz,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
> commit: 47a1886a610aca6a55c18ee677f9176e73162e97 ASoC: Intel: avs: Enable AVS driver only on x86 platforms
> config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071823.2veEqSHM-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 

Oh, I've already noticed this one when doing some cleanups to the file 
and have patch queued internally, but will add above tags and Fixes tag 
and send it upstream separately.

The issue itself was introduced by commit:
d29d41e28eea65 "ASoC: topology: Add support for multiple kcontrol types 
to a widget" not by the one it bisected to ;)

> smatch warnings:
> sound/soc/soc-topology.c:1405 soc_tplg_dapm_widget_create() warn: missing error code 'ret'
> 
> vim +/ret +1405 sound/soc/soc-topology.c
> 

...

