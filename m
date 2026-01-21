Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256834D4C9;
	Wed, 21 Jan 2026 20:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027964; cv=none; b=KES65ipoVl8PtoBtPVmn5NY/L1FTxFzSIeWu+qL8tf1qb/I1TEMHF002YRlj9CUNs+s+B8rSstSXVnFrKucBc0rUOrFbCoOUM8jF/eTmwqRjNpx26FUh6Yx6+PgROaLPb37dOB6NPPaMKRU1Oih6ik0aaCNGVpXZZRTsbxh19mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027964; c=relaxed/simple;
	bh=xOpMNsFQylVOsBcRH+cu2isRcoydT0zQtcqEonA+bic=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gqIWomoGn9IfdMU3sYa6lC6iaLBx4qtvgAToIFG2tPYl+0L0BIEbfVoPMJYnkrSjLW+GdW3vTudptt31RwRGROUZSiUHUR+qVk53O2DCFptWbg6esvrxohmswZyK2DOJR/4TjQoOSfdfn93HTnHRVZAge9XL5Go3fbdx7M119cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1+fDaFjV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1+fDaFjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C86DC16AAE;
	Wed, 21 Jan 2026 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769027963;
	bh=xOpMNsFQylVOsBcRH+cu2isRcoydT0zQtcqEonA+bic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1+fDaFjVmCDf8Us6F7ZtT9ywVlq3AXV0+LbTQeRi1xe8kg0UeUHPjCFJuYtEOVSQe
	 HZqjoQ+1tfkNQwheSesWJs99D4SGDDkJX+hI27trVBTT31w8FQEzYEkhmx4LyWguZB
	 KnCoOgxZFHLRXhe+FezYcfI3a9HBm29nZR8KHX7s=
Date: Wed, 21 Jan 2026 12:39:22 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
Message-Id: <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
In-Reply-To: <202601211636.IRaejjdw-lkp@intel.com>
References: <202601211636.IRaejjdw-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 11:58:20 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hi Pasha,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6c790212c588fddeb0d852f2790840753bb604b1
> commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
> config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch version: v0.5.0-8985-g2614ff1a
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/
> 
> smatch warnings:
> kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'

Indeed, thanks.


From: Andrew Morton <akpm@linux-foundation.org>
Subject: kho: kho_preserve_vmalloc(): don't return 0 when ENOMEM
Date: Wed Jan 21 12:36:17 PM PST 2026

kho_preserve_vmalloc() should return -ENOMEM when new_vmalloc_chunk()
fails.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/
Cc: Alexander Graf <graf@amazon.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 kernel/liveupdate/kexec_handover.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/kernel/liveupdate/kexec_handover.c~a
+++ a/kernel/liveupdate/kexec_handover.c
@@ -1011,8 +1011,10 @@ int kho_preserve_vmalloc(void *ptr, stru
 		chunk->phys[idx++] = phys;
 		if (idx == ARRAY_SIZE(chunk->phys)) {
 			chunk = new_vmalloc_chunk(chunk);
-			if (!chunk)
+			if (!chunk) {
+				err = -ENOMEM;
 				goto err_free;
+			}
 			idx = 0;
 		}
 	}
_

