Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6A175A89;
	Sat,  9 May 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778333539; cv=none; b=rxljWwz5NVZV8Mz6AWii/wnRtpQtz7f4z5ZaYoognVPWSAtBRuhEAlK8tfpBpoyGY9lWsQsGRrOtbgg/40kd4VWAXThIT82toieVrz/ZkKMPk/FrjxDXjDWHxs01GxvkmpsBhwaGca+BYy58+QB7U0ozz5xbmmgrBaExNwyJmDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778333539; c=relaxed/simple;
	bh=o8B5w/VBnPo7mEewiA173E2KYvKAUSsXhIrIS24p/Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPyeIZKzv6vx3xMyNTpYz+I5QGd9eZiOBd39sTDW/FIonguc3OQii+C0HFMoxvvLaGv6+w/+QSvQT8xgS4esXqIObd4ZYRcpXMedI0gRElriLUNUrm0fd7rmGEDTLjlwrgjn8QExZukr/zziWsj8bypiRJsXZU/dkY63Eb/RGTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 649DW9Bm021457;
	Sat, 9 May 2026 22:32:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 649DW9AQ021454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 9 May 2026 22:32:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <89472180-8c8e-4fd8-87bc-7122d93e6c2c@I-love.SAKURA.ne.jp>
Date: Sat, 9 May 2026 22:32:06 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4172/4394] drivers/block/loop.c:413
 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202605092030.FAH71Jou-lkp@intel.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202605092030.FAH71Jou-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp

On 2026/05/09 22:19, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
> commit: 1a83d226268cfb9ea546febe6515f39584df8fd2 [4172/4394] loop: check refcount in __loop_clr_fd() and lo_rw_aio()
> config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092030.FAH71Jou-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.5.0
> smatch: v0.5.0-9065-ge9cc34fd
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202605092030.FAH71Jou-lkp@intel.com/
> 
> New smatch warnings:
> drivers/block/loop.c:413 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)

Thanks, but this is intentional in order to get reported
at https://syzkaller.appspot.com/bug?extid=cd8a9a308e879a4e2c28
after printing debug information.

