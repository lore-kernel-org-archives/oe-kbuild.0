Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E3045A29E
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141557; cv=none; b=QtSngf2LIxackIvxMLrQDXggzPCs1Q2TZSdQgEkKHgYq/sc8oEvcKcFID6S/zqZwhud0iQMYZnrGCkUYJrh3roaTtnf185ojH6ISakzHu6t+uVnzF2EfFrAK8qYahC/aQQnNwnV63TWAC14PjmRfnX5bTw+fC2iby+LCGY6Wu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141557; c=relaxed/simple;
	bh=ktmGE4VloINH0t2kS1qwYQBSbNlThF5dw7Auq437liA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clAQWRYy9xRCEW3oT5Ze5LUiFUJStIlGDQbI3v6oSWZZxUILZKFbvsGbXyVyuflUR5M7rop0Mvut8C984i7K3dg4NFF6eBheWTr/AjxJ8yYMEAlzzbzUmkMpSsSvAFTE2SmiMUfPho8yNURU7Sc0c6i0VhBAxQRlU9rSKkNY9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEOmbW85; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEOmbW85"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so4000552f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141555; x=1792746355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tgD6olnHpkMAt+n5CbhLUN6iepvpEnWn3HXhAZyJ80=;
        b=jEOmbW85Ky3nUKN8OjzTsT+D+qTZkrBx2ILa+ThOJ2sRfxpnLBIkQ1mgjN8MHlVMST
         OvpMMmMC+d8xZI2SdL3fyKhEYLjMCIj982oFZEGppqZTHNGgenzBHBML3QUg+OBrRaEe
         /Uoh5Vn7KBfOew0PhwLZFyn9j5HMUCZ2YhNi2XJYTG3zo0CJtw39M+Ncf/6QY5TKV04v
         R0vG0wc7Pr7yd52vJj71YRqu1ESvgoSWgR/19tZRIUnyIOdLwR/3ICU+HbXZQaKO19K/
         1XNqEQK0CE6mgugMiRvfXe+IXSXwDCBFIdd0/Jd/vBSUTzIF0RSUWoLeZWAr9A3xScpA
         vuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141555; x=1792746355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tgD6olnHpkMAt+n5CbhLUN6iepvpEnWn3HXhAZyJ80=;
        b=VUcJDsUx7nsCcGDnKxuNvpWfLA6hNp5T3DGbJnkmYAwH4oqBzTUeKNRTWUC1AngN4T
         m8K88kYE8KIdEaRm0BygzUU1ZxjlC7/colROEo2SC/izPy/9hqY/O/iPgXKxuSDCEHAk
         5o5c6h1Y8k7vk+ZE7WDvek/gwgB+c55tgfN7smW2ylIBt56qKz4Dp9qV9OTS3593TaDb
         +m+GBngRr80Zl2EEg0G5NjW2NZWsAKNIlUchuizIRizq411++yYDMwGHQDtC19UMuVm3
         eySFTmrjLbgaUNYD88mG9CGFFuNGZBugihHOoXECABwDERCTmar8JYOq7o+LS0o2j65D
         zvcw==
X-Gm-Message-State: AFq9FYIOoXOseItMVhaDCEdGnDFfGhL1cilASLiHw4ZLxLJ7Tse2+B8P
	OCF9ikBGsA2eBq9Y7P3uJOszp5RMiqW+tYjQqfc+Q923HDFzgsS8R5tF
X-Gm-Gg: AYBFou0r7tfbjhtiTX/ulZljwToCH5bW2o7ZeoQrHeav3WVoibYJNG34aBeOjahwuwn
	oDEcawtPZI8VdYTg/SArIofkJozF02G7vsVceG0/sk2/sHxmRjwhmqkcqWGUyMEwYKi+tjsMk+x
	DdOz/elxiecq3wT5kd92EC9Zh3NUWJ1P9eztpBV+CvUdRzDXEvtYoVn/1l5hguW3fNR1lIO5l8S
	/WG4fG+kmqvIaI2kIrWhP/PvZc0PCjGu+fsvFjSbn9IxhHgsGPIPMhElHg9DJ8iW46r6G5lEm7C
	0inc5KxpVTvBDzIs3j6M4JAKHJL5KRyeoSL1zXgkeC27Inl8bKclVf9TQixD2BqcfH3kVn57PYR
	SOblyh0ffSPiq7LD26lgTBb0JlOF+ETew9nQRd9omp4Vh8mmyhrX1ALmpb+r8yDIgSOsMnqT6+1
	K72AxKsVBgsb+ZwvX3f2S63MR+o8pDvM9Y8BG+cVY6bvhIUydxjUv0568rFQlQBkWtFMfn3ZPz0
	xj5ErE=
X-Received: by 2002:adf:e013:0:20b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48dba7b3fefmr30865619f8f.8.1792141554482;
        Fri, 16 Oct 2026 02:05:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm3577318f8f.58.2026.10.16.02.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:05:53 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:05:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Subject: Re: [tytso-ext4:dev 40/41] fs/ext4/inode.c:4518
 ext4_iomap_writepages() warn: missing error code? 'ret'
Message-ID: <atHo7i5Uq9cdeVFt@stanley.mountain>
References: <atHZN9YIl8T2E0tK@stanley.mountain>
 <1165ce1d-6485-4b70-9949-47ee071a0a22@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1165ce1d-6485-4b70-9949-47ee071a0a22@huaweicloud.com>

On Fri, Oct 16, 2026 at 04:49:10PM +0800, Zhang Yi wrote:
> On 10/16/2026 3:58 PM, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> > head:   8c4f6e3376348fc3162eed86a05b933921c8f9ed
> > commit: bdcbb0f19e921c7ea3241f55922032dff23d1d26 [40/41] ext4: partially enable iomap for the buffered I/O path of regular files
> > config: x86_64-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160314.PLMEXaOJ-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > smatch: v0.5.0-9187-g5189e3fb
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202610160314.PLMEXaOJ-lkp@intel.com/
> > 
> > New smatch warnings:
> > fs/ext4/inode.c:4518 ext4_iomap_writepages() warn: missing error code? 'ret'
> > 
> > vim +/ret +4518 fs/ext4/inode.c
> > 
> > a304299a40d92c Zhang Yi 2026-10-09  4488  static int ext4_iomap_writepages(struct address_space *mapping,
> > a304299a40d92c Zhang Yi 2026-10-09  4489  				 struct writeback_control *wbc)
> > a304299a40d92c Zhang Yi 2026-10-09  4490  {
> > a2e096bf59634f Zhang Yi 2026-10-09  4491  	struct inode *inode = mapping->host;
> > a2e096bf59634f Zhang Yi 2026-10-09  4492  	struct super_block *sb = inode->i_sb;
> > a2e096bf59634f Zhang Yi 2026-10-09  4493  	long nr = wbc->nr_to_write;
> > a2e096bf59634f Zhang Yi 2026-10-09  4494  	int alloc_ctx, ret;
> > a2e096bf59634f Zhang Yi 2026-10-09  4495  	struct iomap_writepage_ctx wpc = {
> > a2e096bf59634f Zhang Yi 2026-10-09  4496  		.inode = inode,
> > a2e096bf59634f Zhang Yi 2026-10-09  4497  		.wbc = wbc,
> > a2e096bf59634f Zhang Yi 2026-10-09  4498  		.ops = &ext4_writeback_ops,
> > a2e096bf59634f Zhang Yi 2026-10-09  4499  	};
> > a2e096bf59634f Zhang Yi 2026-10-09  4500  
> > a2e096bf59634f Zhang Yi 2026-10-09  4501  	ret = ext4_emergency_state(sb);
> > a2e096bf59634f Zhang Yi 2026-10-09  4502  	if (unlikely(ret))
> > a2e096bf59634f Zhang Yi 2026-10-09  4503  		return ret;
> > a2e096bf59634f Zhang Yi 2026-10-09  4504  
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4505  	/*
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4506  	 * Submit the pending zeroed EOF block range if the entire
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4507  	 * writeback range lies beyond it.
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4508  	 */
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4509  	ext4_iomap_wb_submit_zeroed_eof(inode, wbc);
> > 53fe71a6bcad0f Zhang Yi 2026-10-09  4510  
> > a2e096bf59634f Zhang Yi 2026-10-09  4511  	alloc_ctx = ext4_writepages_down_read(sb);
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4512  	/*
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4513  	 * Does ext4_change_inode_journal_flag() change the inode's
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4514  	 * buffered I/O path?
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4515  	 */
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4516  	if (!ext4_inode_buffered_iomap(inode)) {
> > bdcbb0f19e921c Zhang Yi 2026-10-09  4517  		ext4_writepages_up_read(sb, alloc_ctx);
> > bdcbb0f19e921c Zhang Yi 2026-10-09 @4518  		return ret;
> > 
> > Either return 0 or an error code here, but not ret.
> 
> Thanks for pointing that out, but this is a false positive. No error
> code needs to be set here. This path is only taken when the writeback
> races with a concurrent journal flag switch, and since the switch will
> write back all dirty data, there is nothing to be done for the leftover
> writeback here and we can just return directly. So the 'ret' will simply
> be 0 here.
> 

Yes, please change it to "return 0;" so it's more readable.

regards,
dan carpenter

