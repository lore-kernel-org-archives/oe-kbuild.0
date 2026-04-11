Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A6E573;
	Sat, 11 Apr 2026 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.160.28.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895246; cv=none; b=jU1Fl4u5E6PcXjEOp+IehulaJhZFHjDT8aMZWnBEHMOy+nNJ5145/pAEykS8XVEU2+Ywj3m68IXAXChCCn03eLpknN63UMiTmQlaedRzJd+/zRMlf4ZyQN6A7wSof/DtqFpaE+Q50IPiMM/39Vvuk2dyfNeufwby8nfd1Ozs14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895246; c=relaxed/simple;
	bh=aJV++zQDbufQndUu+edGWMsRQXfhZnaoFA3FbJoAKbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwqQWsRIqL/KR2/jSX6ToFVJmGjY2+KCTQZkNpEHY9mKQQ1zjBOfplOOQb4z+ox/8QgPTSqtWW8JKJtofOOpvmUkg6Utw1saf6J6XUG8bosYEj/oI9EHP8CdDH3gPoElFbGMnUdDxGb6ZUR779+PklXKRq4eFdXtiQyb9Rssqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com; spf=pass smtp.mailfrom=cambridgegreys.com; arc=none smtp.client-ip=217.160.28.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cambridgegreys.com
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1wBTTZ-00F1Bh-9l; Sat, 11 Apr 2026 08:13:58 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
	by jain.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1wBSMm-0000000EeXd-2QnH;
	Sat, 11 Apr 2026 09:13:56 +0100
Message-ID: <c062f70b-3215-4a6f-90a8-11cadef43510@cambridgegreys.com>
Date: Sat, 11 Apr 2026 09:13:54 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable
 dereferenced before check 'qi' (see line 468)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Tiwei Bie <tiwei.btw@antgroup.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
References: <202604110937.MLUL70Lx-lkp@intel.com>
Content-Language: en-US
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
In-Reply-To: <202604110937.MLUL70Lx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett

On 11/04/2026 08:57, Dan Carpenter wrote:
> [ Obviously, the commit just did COMPILE_TEST or something.  Anyway... -dan ]
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
> commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
> config: um-randconfig-r072-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110937.MLUL70Lx-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
> smatch: v0.5.0-9004-gb810ac53
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202604110937.MLUL70Lx-lkp@intel.com/
>
> smatch warnings:
> arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)
>
> vim +/qi +471 arch/um/drivers/vector_kern.c
>
> 49da7e64f33e80 Anton Ivanov 2017-11-20  464  static void destroy_queue(struct vector_queue *qi)
> 49da7e64f33e80 Anton Ivanov 2017-11-20  465  {
> 49da7e64f33e80 Anton Ivanov 2017-11-20  466  	int i;
> 49da7e64f33e80 Anton Ivanov 2017-11-20  467  	struct iovec *iov;
> 49da7e64f33e80 Anton Ivanov 2017-11-20 @468  	struct vector_private *vp = netdev_priv(qi->dev);
>                                                                                          ^^^^^^^
> Dereference
>
> 49da7e64f33e80 Anton Ivanov 2017-11-20  469  	struct mmsghdr *mmsg_vector;
> 49da7e64f33e80 Anton Ivanov 2017-11-20  470
> 49da7e64f33e80 Anton Ivanov 2017-11-20 @471  	if (qi == NULL)
>                                                      ^^^^^^^^^^
> Checked too late.
>
> 49da7e64f33e80 Anton Ivanov 2017-11-20  472  		return;
> 49da7e64f33e80 Anton Ivanov 2017-11-20  473  	/* deallocate any skbuffs - we rely on any unused to be
> 49da7e64f33e80 Anton Ivanov 2017-11-20  474  	 * set to NULL.
> 49da7e64f33e80 Anton Ivanov 2017-11-20  475  	 */
>
It has been used for quite a while, so surprising that it was not caught 
earlier.

And no, it was not just a "compile test".

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661

