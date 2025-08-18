Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8231CA4B;
	Mon, 18 Aug 2025 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518236; cv=none; b=Ybjhb1KjN8Ydy0pEYlRCVltq/z6lRQMQyuc3up2212fzXHg/JXR+9+UvuMt8drxuf5/7w6TiJ0JE1w6pdR1/Gx8RN7oT0+6gRoOTCJlZHD+9GOMNQJ7yj1r9vV4ceAGa9iMoTIodp800H4aR2k+0odFAqC2NRJgM5YIuzNORWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518236; c=relaxed/simple;
	bh=8pMZ1oin/+iriF81SYdkJnetu+qsH8RFR3qjscMpduk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VyZWi/GxRIDQ6GZhgIcnHumbJ7qGwOcUa+yNzZVWeei1d4ywc5y8yx33ZTplj/dxybeBqwl2b7yK7Y4gAAoLZZf5XxGCDdSpCUy9Rm/bzP4c7CA8OkDpMprk0ZBmgw8ad4a1Ubfr60IZzknasr/Q1QtRRbxnQl0ZqMms06HK4Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fl9uCVGS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fl9uCVGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755518234; x=1787054234;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8pMZ1oin/+iriF81SYdkJnetu+qsH8RFR3qjscMpduk=;
  b=fl9uCVGSnNpnV1XGOkFhNVxOa/cM30S9xGCOyPxCr8paiJkvwKygTIy0
   w6beirhUHf3yKem6l0dw8IegtLEIkcuwKC7YrFC4c6walv8Q+vXhfwy10
   x9PBgUCDSnxsmHuIrU7bsWW1tEL63v73MqJdy5oDJXozE6HkTDuLCh514
   80QddStRnT4EmZ4QQi/OdzCvdCBrGsSt0ve+J4zQmZw5AsZn0OyTFF627
   BkXAlTvNoRy3AVxKuwQedzt6VTU8hrmLMlHWuVWemHBXlfGthV5pOuw4I
   nSUnZRTkg2yoDTGK/ukZI53q1n45aoYS0+iPz+o6nluXLZl2xNhDR3AWZ
   A==;
X-CSE-ConnectionGUID: p+80khTqSuyqATREWgew6g==
X-CSE-MsgGUID: jKsy/yB3QVuZJPNmy6svSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56944385"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56944385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:57:14 -0700
X-CSE-ConnectionGUID: rmQtwpg2Qdi+yYh7dPd8Yw==
X-CSE-MsgGUID: lP+4IwzmROGVAPRVXZdMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="168368236"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.188])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:57:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [drm-i915:for-linux-next 11/18]
 drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state()
 warn: variable dereferenced before check 'i915' (see line 18)
In-Reply-To: <aKLfKK7DpMxMBFrG@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202508160035.hmzuKiww-lkp@intel.com>
 <6be63b523eafadf77d38d8319a011951c283bf9e@intel.com>
 <aKLfKK7DpMxMBFrG@stanley.mountain>
Date: Mon, 18 Aug 2025 14:57:08 +0300
Message-ID: <59b73356c4c6eb8f001337821ced3a7704044983@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 18 Aug 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> On Mon, Aug 18, 2025 at 10:18:14AM +0300, Jani Nikula wrote:
>> On Fri, 15 Aug 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>> > tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
>> > head:   63e0b17ae79a4365e874d7e2ff3816db2e6d55b5
>> > commit: d2e184f8e16ab85876ddcc0779358fbfe5162414 [11/18] drm/i915/switcheroo: pass display to HAS_DISPLAY()
>> > config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160035.hmzuKiww-lkp@intel.com/config)
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > | Closes: https://lore.kernel.org/r/202508160035.hmzuKiww-lkp@intel.com/
>> 
>> Side note, this triplet of tags leads to checkpatch warning:
>> 
>> WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
>> followed by Closes: with a URL to the report
>> 
>
> It's hard to know what to do about that...  There is only one link but
> both zero day and I rely on Reported-by tags to justify our saleries..

Make checkpatch allow multiple reported by for one mail? *shrug*

BR,
Jani.

-- 
Jani Nikula, Intel
