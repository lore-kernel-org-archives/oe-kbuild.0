Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64D1D6B0
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eVPdm35yEAi6MXOLFffQZxHdkcxMNqV/gKh6yiC0GD0=;
  b=J/5l2ZQ8xRnNSnMD1nbiTia213kzOAmgT31+UbHfuBywS4ybwmXPRGnh
   etpx5vpxi9otP5j81R3NsTxMDFd7yVstlp9MsEVosMHkrj82oZ1YEpVMM
   zkFGcBMQTvosbOlLavk5GR+dn1bBz0YbxKq3XOF/TJRVhzDu9xoFB8KiB
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,175,1694728800"; 
   d="scan'208";a="127841919"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 21:05:26 +0200
Date: Mon, 25 Sep 2023 21:05:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: David Sterba <dsterba@suse.cz>
cc: Boris Burkov <boris@bur.io>, David Sterba <dsterba@suse.com>, 
    oe-kbuild@lists.linux.dev
Subject: Re: [kdave-btrfs-devel:misc-next 105/126] fs/btrfs/qgroup.c:3305:22-29:
 ERROR: reference preceded by free on line 3303
In-Reply-To: <20230925175311.GS13697@suse.cz>
Message-ID: <alpine.DEB.2.22.394.2309252103560.3165@hadrien>
References: <202309230501.FnBPmnOv-lkp@intel.com> <alpine.DEB.2.22.394.2309231652390.15175@hadrien> <20230925175311.GS13697@suse.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 25 Sep 2023, David Sterba wrote:

> On Sat, Sep 23, 2023 at 04:56:44PM +0200, Julia Lawall wrote:
> > Please check the tests on lines 3302 and 3304 and see if they both can be
> > true.  If they cannot, perhaps an else code be added to make that apparent
> > in the code.
> >
> > On Sat, 23 Sep 2023, kernel test robot wrote:
> >
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > TO: Boris Burkov <boris@bur.io>
> > > CC: David Sterba <dsterba@suse.com>
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git misc-next
> > > head:   8e6405aa4724626637e23a02ab145b0c69edb7d7
> > > commit: 356d8a4649959f1cb271fbdf7052447592b1d2ec [105/126] btrfs: qgroup: simple quota auto hierarchy for nested subvolumes
> > > :::::: branch date: 3 hours ago
> > > :::::: commit date: 22 hours ago
> > > config: i386-randconfig-053-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > | Closes: https://lore.kernel.org/r/202309230501.FnBPmnOv-lkp@intel.com/
> > >
> > > cocci warnings: (new ones prefixed by >>)
> > > >> fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303
>
> Is there a reason whye the mails haven't been CCed to linux-btrfs@vger?
> I don't know if the build bot reports are always relevant so it may make
> sense to report it privately first and then to forward after a human
> review.

I'm not sure how 0-day chooses what to include the CC list.  Perhaps send
them a mail directly asking for the mailing list to be added.

julia
