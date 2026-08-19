Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702933AF674
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146334; cv=none; b=iheCQXsdmAxLnslTcJOgrBB8inSn8hAUXZSTQ1YpCUO7FG2y+eiRGihefiV0Fyi1CR4akolPKxRcQAGe878qN2/nDLvecT+eX/q+v0wfd+oyewgDnKwY0vwCmLw0JvG6ijLKvVSaxytcIZtF6l7ObfgRPVCqjSJ8YS5ny0ggQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146334; c=relaxed/simple;
	bh=EByr9AXNmbPVZQo9tjBdi4J4HcUV8lIADq4ow2Tvrrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6YoZtLFzW4msO9KWXc+hDBtHKN4Ki5NskY+DwOFhJ8Ol70RQh4H8kBSDrK/2SO4vCdjbzGUWhtW5r5aGdMFNOnQQ4d7lTe+oLMbsizjNPvixmfpkSKueLs4KhU7DL9yCJ4OG5+Zej6d301uGGT4hR+dkDNuVTy2FlvbUqREpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzqrs3m7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzqrs3m7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4798bea72f9so569210f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787146329; x=1787751129; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Rd270eebvrbTcBx94fHid2ojU8F5U5O89LHfz2gRvo=;
        b=Dzqrs3m7xGviBm+134i1tIMum592vD396ygWD3gmGczU+is03Dl7EnSPV5GYVRftry
         Kg9FvSIqZzUKsI19cG/StPFWAtnls4OR+kTA1uctgJ3syK7q9oF4TaJFK0EEJZG7gYVM
         lITviGOucXyrgjbYxj0C9/b0fb7qBYsap+TYMXpU5TLAEZaALiENoquGz2/Z84BVj7q8
         Xy2oCJaRbcfy3u6AGUQFtxZEN4M5F2XUNo2Bk9aHw5cKCZLNgit4cdfSpgVif6ixHgzJ
         b+h523V+zxSaGD/2E87Q67Sq539mzz3ECWScmYZ2XRfYJ+78/kZdD2xxOuZGsIUpwQDv
         /GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146329; x=1787751129;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Rd270eebvrbTcBx94fHid2ojU8F5U5O89LHfz2gRvo=;
        b=XNKTtEWlskuoEOC0wPMc+8z1Qt76A2dx8HWYOPjE6+mp5SUgPf0Q0c8dEVyzeEd1gz
         1LEO33uO1528ZL8U6iJlo7OmqI0bkWgMBZBRei9rnHys3FecVL2iBLI5VHiCy1vm42QR
         /5QeEoeZZ7XtsMWelIZhNU81Iyiz20jkwNcOP6sGqxyJgI1nC9/Ava0riQ4ALXBbXB2b
         Hy+fG9m1VX14OhfFTxQKfXpwdq0ntDOZsHz4/QZnxBw49E6esu/t5OmaRJatvT8iRiZW
         pl7kijq2o3R5tSIObaM1s/3JNagMsY7R3VvSG3vO2Xj+/VioviSQrYJHtGzY4ncUXVL3
         PVEg==
X-Gm-Message-State: AFuF++nEo61wK829qTGVXo0DLd7MCSXS2XJW1Watru6wMH9bFr9GcFW/
	zA8LW1UGgcpct8vQMKUaE7DMfUltQ3qM50mb/TGYI43/LKXx0rW/KNm6c4ZiSsWallWxuTQn
X-Gm-Gg: AR+sD13wui23G5InktuDmEqTtQVJy5KgeeNuYb/ksNeVwEYuYJKofwlFJUoVllLeL0G
	XeL5KWhJEpS4X7kdo6iv/K5i/wq1MoyWevUPwznk2oKhQ4CIGiwkM0faNQrTYdR0H0LLKswcvdW
	PWCNfuXOyhJxL0kyzHdIJ8UGxxQvdIytupVjmhBJvgMVNNYCGvayRW7lTdm9hQkL7rQrNIYwkIS
	C+YZY/Hh4fCk2QBVZOAiaqmQHbrndLDsVauz5/Wl6gV57VFBtkvywFBBSK9kwEniQ/wCubexBIj
	p7+/JuB2u4gXMS6uyB3NeibwE4IXWaXVqyXK1X8BelW20ii8bwakrS1dQMMiV43VKAxC3waEvDl
	LmGwIc8dlPDtKrTP54f+seTXbke3do4vB81mbuoQ+N3F59W2cF1XZMCGZeKS3uHBciniuDuGTLJ
	soqa79Lc3xVHXEBlvok6pC5lY5K8ZPjqNNtGEYvL2bqX0efYkvDzdvcPjx
X-Received: by 2002:a05:6000:2209:b0:482:a9d9:64df with SMTP id ffacd0b85a97d-482b1fdcb39mr8382775f8f.12.1787146328601;
        Wed, 19 Aug 2026 06:32:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b80a5sm5958636f8f.24.2026.08.19.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:32:07 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:32:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-ratelimit-2 73/76] lib/dynamic_debug.c:136
 ddebug_arena_free() warn: sleeping in atomic context
Message-ID: <202608192133.1ujPLawx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260819133204.0IWlPMRO1DTJ7vBomXmW0gOgTPtnZ3K4cLKyKzsQ08Q@z>

tree:   https://github.com/jimc/linux.git dd-ratelimit-2
head:   31212444bcca4d1547711ec572b5a398d74640ca
commit: 29d01faf08d63c34e46af173536be5af2aaab4fb [73/76] lib/dynamic_debug: Refactor ddebug_arena to vmalloc backing
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260819/202608192133.1ujPLawx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608192133.1ujPLawx-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:136 ddebug_arena_free() warn: sleeping in atomic context

vim +136 lib/dynamic_debug.c

b80df25b9600208 Jim Cromie 2026-07-15  125  static void ddebug_arena_free(struct ddebug_arena *arena)
b80df25b9600208 Jim Cromie 2026-07-15  126  {
29d01faf08d63c3 Jim Cromie 2026-08-11  127  	struct ddebug_arena_chunk *chunk, *tmp;
b80df25b9600208 Jim Cromie 2026-07-15  128  	unsigned long flags;
b80df25b9600208 Jim Cromie 2026-07-15  129  	static DEFINE_SPINLOCK(arena_lock);
b80df25b9600208 Jim Cromie 2026-07-15  130  
b80df25b9600208 Jim Cromie 2026-07-15  131  	spin_lock_irqsave(&arena_lock, flags);
b80df25b9600208 Jim Cromie 2026-07-15  132  	arena->free_ptr = NULL;
b80df25b9600208 Jim Cromie 2026-07-15  133  	arena->remaining = 0;
29d01faf08d63c3 Jim Cromie 2026-08-11  134  	list_for_each_entry_safe(chunk, tmp, &arena->chunks, link) {
29d01faf08d63c3 Jim Cromie 2026-08-11  135  		list_del(&chunk->link);
29d01faf08d63c3 Jim Cromie 2026-08-11 @136  		vfree(chunk);

vfree() is a sleeping function so you can't call it while holding
a spinlock.  If you call it from interrupt context, though it doesn't
sleep.  A bit weird like that.

b80df25b9600208 Jim Cromie 2026-07-15  137  	}
b80df25b9600208 Jim Cromie 2026-07-15  138  	spin_unlock_irqrestore(&arena_lock, flags);
b80df25b9600208 Jim Cromie 2026-07-15  139  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

