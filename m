Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380733B6DB;
	Sat, 11 Apr 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775903095; cv=none; b=jJWE9UkAaVhLxMZ4v3Hfu5y3jU3fQcfa0r6umQJ5jsGl1z20e8JD2jotEggsGMDaj0zCAmFFTyMSvHgLMe5wBo8FbzqVBvN1UASvnRarGGsIPKc44J8P9Mx9zLJ7JgP0Hc0K2j4WTIBpx4duKbRFm1pTcZKURtwLDd2GFXU5t0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775903095; c=relaxed/simple;
	bh=RihVEvHhmEWCEVvyH65piDdPQ0QeN2WYELuQtHUyjjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fjR8LPKSkS4SWcWGQ7i4j4b2W3d6XzPOqyj0Qjm+D0o8dYHicxJkOU/3oA198yFktRmI0S++6uPmL/dLAz+itZqeHwc8j+fPjaF9c29Nv5/CpCvDoik8Ci04sNToy/Ty8OX34VBcS1cgpB7ctfuehaau06xmkfJoG6SNCFFyXHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=KWRfXSn+; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="KWRfXSn+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1775903084; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Rt8NQQ1AYEK7pQDefE+TqXfbxTW3Ai7pygSQVOP5Lyw=;
	b=KWRfXSn+4T53/JNRFxI2HXpS5oglnmMon+5Tvdq9/NoxkegbMGP0OxfEYegUbAJ3drGk+TjAvZkKnWyc/Up6gfAEY+2peWpJnz/Wp/FpRMo1I1fB91fz4ozrOVG5RP0uImMW+1vL3D9z4tKDxEcni16w6HY7PZkbWwWSpDi1wR8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=tiwei.btw@antgroup.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---.h9lxysu_1775903062;
Received: from ubuntu..(mailfrom:tiwei.btw@antgroup.com fp:SMTPD_---.h9lxysu_1775903062 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 11 Apr 2026 18:24:43 +0800
From: Tiwei Bie <tiwei.btw@antgroup.com>
To: anton.ivanov@cambridgegreys.com,
	error27@gmail.com
Cc: johannes.berg@intel.com,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev,
	tiwei.btw@antgroup.com
Subject: Re: arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)
Date: Sat, 11 Apr 2026 18:24:13 +0800
Message-Id: <20260411102413.4168998-1-tiwei.btw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c062f70b-3215-4a6f-90a8-11cadef43510@cambridgegreys.com>
References: <c062f70b-3215-4a6f-90a8-11cadef43510@cambridgegreys.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 11 Apr 2026 09:13:54 +0100, Anton Ivanov wrote:
> On 11/04/2026 08:57, Dan Carpenter wrote:
> > [ Obviously, the commit just did COMPILE_TEST or something.  Anyway... -dan ]
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
> > commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
> > config: um-randconfig-r072-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110937.MLUL70Lx-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
> > smatch: v0.5.0-9004-gb810ac53
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202604110937.MLUL70Lx-lkp@intel.com/
> >
> > smatch warnings:
> > arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)
> >
> > vim +/qi +471 arch/um/drivers/vector_kern.c
> >
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  464  static void destroy_queue(struct vector_queue *qi)
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  465  {
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  466  	int i;
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  467  	struct iovec *iov;
> > 49da7e64f33e80 Anton Ivanov 2017-11-20 @468  	struct vector_private *vp = netdev_priv(qi->dev);
> >                                                                                          ^^^^^^^
> > Dereference
> >
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  469  	struct mmsghdr *mmsg_vector;
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  470
> > 49da7e64f33e80 Anton Ivanov 2017-11-20 @471  	if (qi == NULL)
> >                                                      ^^^^^^^^^^
> > Checked too late.
> >
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  472  		return;
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  473  	/* deallocate any skbuffs - we rely on any unused to be
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  474  	 * set to NULL.
> > 49da7e64f33e80 Anton Ivanov 2017-11-20  475  	 */
> >
> It has been used for quite a while, so surprising that it was not caught 
> earlier.
> 
> And no, it was not just a "compile test".

+1, I use it often. It was not just a compile test.

All callers of destroy_queue() already perform a NULL check, so qi will
never actually be NULL (I guess that's why it wasn't caught earlier):

https://github.com/torvalds/linux/blob/e774d5f1bc27a85f858bce7688509e866f8e8a4e/arch/um/drivers/vector_kern.c#L583
https://github.com/torvalds/linux/blob/e774d5f1bc27a85f858bce7688509e866f8e8a4e/arch/um/drivers/vector_kern.c#L1147-L1150

Regards,
Tiwei
