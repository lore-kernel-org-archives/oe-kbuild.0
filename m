Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF73219EA
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 17:59:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8FE6021846;
	Mon, 25 Sep 2023 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695664788;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojqBsym5s9PyyYZ528HKtpBYbZlBC35gioXro8+q1rY=;
	b=Jmhz1hC7GQuIVNoUpQAVS/gZVDDpiQy1mj0lhEQsjk1OxZVXF0rE/jJmlr0shMRpSZkuPm
	Wxa5OdfhYR1NwMH7DlIhHLp+WCqElV1f4NIGQyidBpPXrDIjc6T3gLY4hZqXRCFrUi4kM6
	p5jbOUMvDVMxWBl8d0hna/aOVGgx4Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695664788;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ojqBsym5s9PyyYZ528HKtpBYbZlBC35gioXro8+q1rY=;
	b=tehMviQqK5ABYLSEKr39ipSoskG8tSEmiRqadmXSpIqedXwilTqTVO/ufq13fVGrZAUYKq
	4+aiErvnnvP4T9BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AE3713580;
	Mon, 25 Sep 2023 17:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +rXPFJTKEWXHIwAAMHmgww
	(envelope-from <dsterba@suse.cz>); Mon, 25 Sep 2023 17:59:48 +0000
Date: Mon, 25 Sep 2023 19:53:11 +0200
From: David Sterba <dsterba@suse.cz>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Boris Burkov <boris@bur.io>, David Sterba <dsterba@suse.com>,
	oe-kbuild@lists.linux.dev
Subject: Re: [kdave-btrfs-devel:misc-next 105/126]
 fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303
Message-ID: <20230925175311.GS13697@suse.cz>
Reply-To: dsterba@suse.cz
References: <202309230501.FnBPmnOv-lkp@intel.com>
 <alpine.DEB.2.22.394.2309231652390.15175@hadrien>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2309231652390.15175@hadrien>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Sat, Sep 23, 2023 at 04:56:44PM +0200, Julia Lawall wrote:
> Please check the tests on lines 3302 and 3304 and see if they both can be
> true.  If they cannot, perhaps an else code be added to make that apparent
> in the code.
> 
> On Sat, 23 Sep 2023, kernel test robot wrote:
> 
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > TO: Boris Burkov <boris@bur.io>
> > CC: David Sterba <dsterba@suse.com>
> >
> > tree:   https://github.com/kdave/btrfs-devel.git misc-next
> > head:   8e6405aa4724626637e23a02ab145b0c69edb7d7
> > commit: 356d8a4649959f1cb271fbdf7052447592b1d2ec [105/126] btrfs: qgroup: simple quota auto hierarchy for nested subvolumes
> > :::::: branch date: 3 hours ago
> > :::::: commit date: 22 hours ago
> > config: i386-randconfig-053-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > | Closes: https://lore.kernel.org/r/202309230501.FnBPmnOv-lkp@intel.com/
> >
> > cocci warnings: (new ones prefixed by >>)
> > >> fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303

Is there a reason whye the mails haven't been CCed to linux-btrfs@vger?
I don't know if the build bot reports are always relevant so it may make
sense to report it privately first and then to forward after a human
review.
