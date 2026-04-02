Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B622C0F6D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157379; cv=pass; b=FCOCZUw7ylO4/T+j1tcTVYzfTTaonB6esy9lKukacpQK6XCyhQt9P51VpmXWT6ObOsDiVjObsJNa6HLCf75F2ElL7II+HY2kw9XZRQCKHPBxgs1bdmpLMQbg1PPTXULchBDfUICdwSu00pR7W0B1Jp43SeZUgGxha3NtJpkWHRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157379; c=relaxed/simple;
	bh=AkTXuskHgqFSHuPaesiQpEtKQBcqndFo0G825t42ZQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fr/6DIuLGNaeYswrD2JIoTp1i4WfuAypVERBs1DuWcX3cDn0ikUFdxZAS9FixK6Cq4QF5xbD81g6BIP5TPt2RDGxwPiM5vpfx72QjNb4TYdALpIpFnqIQJ18SnikY9K3Ap9WttAUPfeA5NvY7vMEVY3P8+KSbV+b7ZZs+JMQ1q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKQY8uOh; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKQY8uOh"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cfbfdabf3fso134681685a.3
        for <oe-kbuild@lists.linux.dev>; Thu, 02 Apr 2026 12:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775157377; cv=none;
        d=google.com; s=arc-20240605;
        b=b+AnkGw5WRwXQyol6FK9rVQA4i+FzUhsJnYHeseKUNCTTii2/7GHDkmUhUABn7Rz0+
         /YZ+LRuo9ubzRR5kCiDTrfBEoWv4Tarxv0FxEr+4jwINpcphAKdXy4v5pEc6Ig5wFmR1
         4oH+KX09WsEyzUNARK6mcH0Ros4Rarz+N6aS0Pq7byY9eejZIUDk3peWhGgx7OX+4Fem
         cWcsj+aoxHloQOIDzYfAyGZP5SEywk5hosZAm+PxDsYN5fwhdVumX6styblbECNrRmtn
         RtSjJRfvgkaMFdkEa6QFPYCfp/txGjFcQB5OSDyO55zJm/YCJkTNnZHtmciSgHLTnyKI
         SDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        fh=BHMEyDuQ1WwwW5u03NtEKtuuJYw069+ZPGYcvpMH5NA=;
        b=NIVOW5GYcJE/5aI5JGwOn+06ZAO+UN7Ku7Qtv8zFgItHSlDLIpfAFwag6bA9oAd1Jm
         63vvJekrX8vSMvlEwfg5LpUthshSpo1jcNCPidqEDBhSDBvz95U4HjL1skAmODbYu2pw
         mHWuibKaXQnZZkVkpBRMECDkyV+ZKf8xUFKk4qmMzTqmSxPUC9Hx/8s+K7HARi5uSzF/
         tr3F0K8ltYw7Amx4k9xCHGWb+S7/A2SuRBlgtKx1QuCu/lOFr0oqOpXrWBtBf4ofsqKg
         XRJ1jlK1aYQnveIrljJ7NezqmnqZql/WwTNwaH/KrJiP9hkFGXuJAuTvyeK+qlx8sF2R
         OxNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775157377; x=1775762177; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=TKQY8uOhG/BpPjMRhUVMiwqNkSUxeM7DEdc7RrdPz6MqeniLuV5Rqk3mBoCFmiCHsn
         ohcMFIzwkCxiVqkKju6qiN2Yhks3gcvN1AJ9Zn9MnEb+r2Eyur8OAF7X+eycgg4PsdJo
         +7jmjq7rksCqP5hrpnoGee82Oqw+1HURI2LgcsMw7BknLNdnee93LQYhyVjK6Ha54R4h
         v6eHhiCDIijYytWBBWKKtKQFk+0VGEwc5y4uN4l542HI8HCbNJlI0YyD4YH2zzWUHBaU
         lZ3129cdODYXoSGIxfARrt/rVFZz6iWj6NvBZBxOx0pdoZA951s4yBwPQBQcLq1OF77m
         1tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775157377; x=1775762177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=FczmCBlsDNn0j8SX4pvMjmk80sSi9RGthGlH0YFMWwO9GhKLAHZ4IJbj5vZg0KCygD
         s9WV/hOxg8yNWLshk6lX9d37TXxuNpuwB7AJNpVxqge5M1fB4j4ebNGUgvilzAH9RwYW
         EL6YIPQhJ9j/tFLF/27OPEmHJ+55vCOaQMqQGQLnT3uMhrYTPcW8Ycr2rDNIiinu8jX5
         PjSeTA+pQY5/YWGZltLgGbW6+FC4pwRO+FAX3VtKXk6cdPBWdw7fjQr7Rdit+61yQRY3
         2BnM2cW/srYUd0wfb0QQrSOMzxcRvT+QWefzm/geIxlON5EQL8Qqhp3hmVhgWja7gQZp
         z/CA==
X-Gm-Message-State: AOJu0YyitZNYAfcOlC33IdNllmCDvtEwqQhRNhOcqKHU9BN+s2tIayX1
	NNTplNfs4G7Twb626DUKu6i8L6tPU04OqgBu/IZEmXt/RTNO8ymJiY1B0mWh3ZCBXiEduPEiqog
	6CVCHyOHccik4yNbuS54AVqB8e8d1eBECmLA8byFbVjZOOd3a6SdhWJEw
X-Gm-Gg: ATEYQzzcnbrbv8JonSuBSq9ww4keW+AMm6g+zwZykMi1Z3vHDAZwI7M8sGOkpleu9Wn
	rb8Y27xGj43nx09wAts0Jvz8B/3CetGEWg31kUvw9kkcWly2mbI9Q7NYfjCOnBwm9gdHFxhk2YJ
	xs7Lvg9NmbuWbFUgeGlejLkfiJgrOQ9iK1Lwi1iCaSTpDm4zbXQL8rlL8AGALj5FtP51hCHWB6a
	7hY+WyUvWRHelMcf8vmFoDvrwEpIQra4F+aRlv5Z+Piyq27BGPi5XObYqKD2AkT+0qXP2e9yDw9
	7AyT6rhAcY5ur8o/RHrnL5kAPneLhfyzPNLapyv1xwHVQV67Ew==
X-Received: by 2002:a05:7022:ec17:b0:12b:ebb8:e518 with SMTP id
 a92af1059eb24-12bfb779d53mr79037c88.35.1775156960783; Thu, 02 Apr 2026
 12:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com> <ac6h2jF-KJ5pm1WM@stanley.mountain>
In-Reply-To: <ac6h2jF-KJ5pm1WM@stanley.mountain>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 21:08:44 +0200
X-Gm-Features: AQROBzAm7ykm8zO9ipWjQHBso2-gdwz4n-a0cr85SYjLzctukNDeZ0kKGTltKIc
Message-ID: <CANpmjNPME07RK+jKnw233BYHX7wVMqCzFYpB2cSN4+DMgTSpuQ@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 19:05, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> > On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > Hi Marco,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > > config: um-randconfig-r072-20260401
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > smatch: v0.5.0-9004-gb810ac53
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> > >
> > > New smatch warnings:
> > > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> >
> > How is this related to the patch I sent? Did the <linux/slab.h> change
> > force rechecking of all these files and it found latent issues?
> >
>
> Oh, crud.  It turns out that for this check Smatch allows
> integer_array[sizeof()]so long as we know that the index is within
> bounds.  What happened is that your patch renamed the kmalloc()
> function so Smatch stopped knowing the size of the buffer.

Oh, I see. Smatch doesn't respect the __alloc_size attribute then?

> For these zero day bot warnings, the emails are automatically generated
> so I don't have any context outside what's in the email.  I saw that
> Kees wrote the code, but I figured maybe you forwarded it or something.
> Sorry about that.

No worries and thanks!
