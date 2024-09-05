Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6819DF68
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545263; cv=none; b=g8JNbLpZXlaUfRYgA1mDwADjGnC4mc8HHB2pbQhMa9PheBivLsH2glhIsYLl+27G0itzRLvoIek0ZFtF6nDoEkJ8UeyQBs1l1oFAMV0aaLrR1MgIRTPkhaIz7G+3Y7RMU4Ctk15CO6Ah/yYCaSSG9uWTHcdGNuuu6p/FCQqD4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545263; c=relaxed/simple;
	bh=Q/gKMV4/3BBHIpoB2D+a3mIXcjuYlkjt87RtE+rrgEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L46eXQgTUA0igxCt+8ZttFwoHfsUQtTH2rBVkRpZDvcQWt4eyFtVIc2+vYbCzyqzcVZUccJlPQZAPPDqDc+ztbDpkAvGiYz/B/YeV8CgodmNh9llV//sKFQQlC1H290tATUnJGacQaY8d9ce8AQMHlANpujCyQgzT+jipwrRtuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=J4yEaG8H; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="J4yEaG8H"
Received: from cwcc.thunk.org (pool-173-48-102-194.bstnma.fios.verizon.net [173.48.102.194])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 485E7FAs007431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 10:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1725545238; bh=Ti9jiaZGhhMUDDsYk9GbJj4/hK2lo0lUfTXW+pqZIsQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=J4yEaG8HqWKFVX1s+Gb9AOET79kFgjw7RAcApdYyN+jBeNfSSz66MiMXepqWfdfi4
	 VeuxS4spvwnpD1HUFP6jwFqIEdPlAzy43Guki+JIFSeI1qBqAKIVYJgQwGgbHFwYkM
	 +4zJzq023wbrkdfIwQerNeuLMEFlJCsjzfXxfRiZbN4H3Ebwl3mEe2ud3ZAaeUkdbC
	 lPEgnJCOSaM11PP/467djbD7Dn5mAUCUdL65z/4IdSw2sH/0s72nUsqRlG4HrZ9vIE
	 xorcZPsZ7D2BknzGodsdiRlkFBsP2M358JZu2kpbaH9mVfQtrEQAoNxfGuNBwVA4ov
	 F9ZGCIpgDCuvw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 50F7F15C02C6; Thu, 05 Sep 2024 10:07:15 -0400 (EDT)
Date: Thu, 5 Sep 2024 10:07:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Baokun Li <libaokun1@huawei.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
        oe-kbuild@lists.linux.dev, Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        Yang Erkun <yangerkun@huawei.com>
Subject: Re: [linux-next:master 8348/9291] fs/ext4/extents.c:6155
 ext4_ext_clear_bb() error: double free of 'path'
Message-ID: <20240905140715.GV9627@mit.edu>
References: <0a03c332-20ff-47ef-8a33-e52b4736d05b@stanley.mountain>
 <c2711f3d-6bee-414c-952f-5c33da315a1a@huawei.com>
 <20240905132335.GT9627@mit.edu>
 <2e4f662b-2c52-4148-afea-0f7d09d2776b@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e4f662b-2c52-4148-afea-0f7d09d2776b@huawei.com>

On Thu, Sep 05, 2024 at 09:31:35PM +0800, Baokun Li wrote:
> > > Ted, could you please help push the corrected commit to the next branch?
> > The next branch gets automatically refreshed every day (Mondays
> > through Friday).  In the case of the ext4 tree, it gets picked up from
> > the dev branch.  So it should be fixed in the upcoming fs-next and
> > linux-next branch.
> > 
> > Cheers,
> > 
> > 					- Ted
> > 
> OK, I didn't know it was pulling automatically, thanks for the explanation!

Yep, and some of us have automated test systems that run whenever
fs-next is updated.  :-)

For example, see attached.  (I have been planning to get this
published someplace, such as a linux.linux.dev list, but I've been too
busy finish up making it be fully robust and not subject to rare
failures that require manual interventions, and I need to complete
some negotiations with Konstantin.  Probably after the Linux Plumbers
Conference and I have a bit more free time...)

						- Ted

TESTRUNID: ltm-20240729133952-0028
KERNEL:    kernel 6.11.0-rc6-xfstests-00781-g8d32ae66515d #1 SMP PREEMPT_DYNAMIC Wed Sep  4 21:56:52 EDT 2024 x86_64
CMDLINE:   -c ext4/all,xfs/all,btrfs/all,f2fs/all -g auto --repo https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next --watch fs-next
CPUS:      2
MEM:       7680

ext4/4k: 570 tests, 2 failures, 51 skipped, 5668 seconds
  Flaky: generic/234: 20% (1/5)   generic/277: 20% (1/5)
ext4/1k: 564 tests, 2 failures, 54 skipped, 6139 seconds
  Failures: generic/627 generic/750
ext4/ext3: 562 tests, 144 skipped, 4388 seconds
ext4/encrypt: 545 tests, 167 skipped, 3169 seconds
ext4/nojournal: 562 tests, 122 skipped, 4013 seconds
ext4/ext3conv: 567 tests, 53 skipped, 5500 seconds
ext4/adv: 563 tests, 2 failures, 59 skipped, 5186 seconds
  Flaky: generic/047: 20% (1/5)   generic/547: 20% (1/5)
ext4/dioread_nolock: 568 tests, 51 skipped, 5108 seconds
ext4/data_journal: 563 tests, 127 skipped, 4489 seconds
ext4/bigalloc_4k: 541 tests, 1 failures, 55 skipped, 4766 seconds
  Flaky: generic/320: 60% (3/5)
ext4/bigalloc_1k: 542 tests, 64 skipped, 4814 seconds
ext4/dax: 556 tests, 157 skipped, 3022 seconds
xfs/4k: 1142 tests, 2 failures, 180 skipped, 10178 seconds
  Failures: generic/754 xfs/432
xfs/1k: 1142 tests, 3 failures, 167 skipped, 14218 seconds
  Failures: generic/627 generic/754 xfs/432
xfs/v4: 1141 tests, 2 failures, 474 skipped, 8851 seconds
  Failures: generic/754 xfs/432
xfs/adv: 1142 tests, 2 failures, 166 skipped, 10238 seconds
  Failures: generic/754 xfs/432
xfs/quota: 1142 tests, 2 failures, 165 skipped, 11276 seconds
  Failures: generic/754 xfs/432
xfs/quota_1k: 1142 tests, 3 failures, 167 skipped, 13616 seconds
  Failures: generic/627 generic/754 xfs/432
xfs/dirblock_8k: 1142 tests, 2 failures, 165 skipped, 11244 seconds
  Failures: generic/754 xfs/432
xfs/realtime: 1141 tests, 4 failures, 518 skipped, 8342 seconds
  Failures: generic/260 generic/455 generic/754 xfs/432
xfs/realtime_28k_logdev: 1141 tests, 4 failures, 600 skipped, 12882 seconds
  Failures: generic/260 generic/754 xfs/432 xfs/598
xfs/realtime_logdev: 1141 tests, 4 failures, 572 skipped, 13036 seconds
  Failures: generic/260 generic/754 xfs/432 xfs/598
xfs/logdev: 1142 tests, 3 failures, 235 skipped, 17787 seconds
  Failures: generic/754 xfs/432 xfs/598
xfs/dax: 1152 tests, 1 failures, 551 skipped, 5930 seconds
  Failures: generic/754
btrfs/default: 1038 tests, 4 failures, 278 skipped, 9576 seconds
  Failures: btrfs/012 btrfs/277
  Flaky: generic/418: 20% (1/5)   generic/746: 40% (2/5)
f2fs/default: 720 tests, 7 failures, 245 skipped, 5432 seconds
  Failures: generic/050 generic/064 generic/252 generic/563 generic/735
  Flaky: f2fs/004: 20% (1/5)   generic/475: 40% (2/5)
f2fs/encrypt: 702 tests, 4 failures, 352 skipped, 3064 seconds
  Failures: generic/050 generic/563 generic/635
  Flaky: generic/475: 20% (1/5)
Totals: 23089 tests, 5942 skipped, 234 failures, 0 errors, 197866s

FSTESTIMG: gce-xfstests/xfstests-amd64-202408121130
FSTESTPRJ: gce-xfstests
FSTESTVER: blktests f043065 (Thu, 20 Jun 2024 16:26:22 +0900)
FSTESTVER: fio  fio-3.36 (Fri, 20 Oct 2023 04:30:43 -0600)
FSTESTVER: fsverity v1.6 (Wed, 20 Mar 2024 21:21:46 -0700)
FSTESTVER: ima-evm-utils v1.5 (Mon, 6 Mar 2023 07:40:07 -0500)
FSTESTVER: libaio   libaio-0.3.108-82-gb8eadc9 (Thu, 2 Jun 2022 13:33:11 +0200)
FSTESTVER: ltp  20240524-131-gdfb293ee0 (Mon, 29 Jul 2024 09:57:32 +0200)
FSTESTVER: nvme-cli v1.16 (Thu, 11 Nov 2021 13:09:06 -0800)
FSTESTVER: quota  v4.05-67-g8254bec (Mon, 29 Jul 2024 12:24:36 -0400)
FSTESTVER: util-linux v2.40 (Wed, 27 Mar 2024 12:46:59 +0100)
FSTESTVER: xfsprogs v6.9.0 (Mon, 22 Jul 2024 11:05:03 +0200)
FSTESTVER: xfstests-bld 8456529b (Wed, 31 Jul 2024 22:17:54 -0400)
FSTESTVER: xfstests v2024.08.11-7-gc3fc1ccce-dirty (Mon, 12 Aug 2024 11:25:51 -0400)
FSTESTVER: zz_build-distro bookworm
FSTESTSET: -g auto
FSTESTOPT: aex
