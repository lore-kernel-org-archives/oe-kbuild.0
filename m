Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD27081E;
	Mon,  6 Jan 2025 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196032; cv=none; b=uVV6Ko431yoDpNN5uJpyQzA80GkKQqDAZ1bQQST4cBBJ0pYbzqYEQ+pVWVDHg99Ha52WlJ7XD+hbbJ/NIXEkfTygqoB/BMbjFkQSTkHSCp0E3bur7lg5geD1QEw6wYxSQBo0TbQCmwh83Ya5mAtjNgico9wix+FnpdSCDS2MZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196032; c=relaxed/simple;
	bh=SaR0YnPa4eDCNH2V7kPhqI+8zzTtomJB5TUHEoNLy5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oqkc1WeqUKUrePiBuqJpptRW5tzpsTeNZ1zBY3NiJqPhJmnSG3wEQfXPg86MOUti9aeFR5BoL2zlS+rfRwCWU09siaGd96b7jN2zSqJoUoMGrHr3WePHAJ+f3jTxz21monxROpL6s2PU6o57zqy3DuAAOIzTb1ORT3umWSC2cS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POTtvzoq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POTtvzoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE84C4CED2;
	Mon,  6 Jan 2025 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736196031;
	bh=SaR0YnPa4eDCNH2V7kPhqI+8zzTtomJB5TUHEoNLy5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POTtvzoqHdUO+We6+awLEKRYhFfc9nrzJLeZs1apKyZf1ruwX8MYtKSIBxREtQhe3
	 KDqjiSRYGZuZQzjflSYJzmYk3uEx3AVGYkypzCQ0YhQNuI58CoQk12h9qINNQnkVAl
	 8fxMKFBlFfCtugWZxoAH9Jg+752s7m7gjEBlXKG5mmXfhPopME9Oe0QchVg93QRik7
	 KYeyfNLZvPnypyFYRzxFF+dwsLUHhqhQ4XXykz2lJ7QuBstooCYm92d3lThIlPcYhp
	 51dtnLaEkoK6AVub+t7cVj1fNxeLNIjfMcC3Bzto/I5ITqmIYkco5qMPxOD6j4orNo
	 cHxs28cRJJ3Qg==
Received: by pali.im (Postfix)
	id 836AD8AF; Mon,  6 Jan 2025 21:40:20 +0100 (CET)
Date: Mon, 6 Jan 2025 21:40:20 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [pali:cifs 20/48] fs/smb/client/cifsacl.c:1514 set_cifs_acl()
 error: uninitialized symbol 'access_flags'.
Message-ID: <20250106204020.4x6odds53jdc3nh3@pali>
References: <8e2d1d8e-5830-4342-b646-ccf025d2c508@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2d1d8e-5830-4342-b646-ccf025d2c508@stanley.mountain>
User-Agent: NeoMutt/20180716

On Monday 06 January 2025 13:46:56 Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
> head:   cc26137de51202e7210b058f6696393f1e006d46
> commit: ce9f9c0511bbb913daa982afed5859ab68adf0e8 [20/48] cifs: Fix getting and setting SACLs over SMB1
> config: riscv-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281410.msF9yv6K-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202412281410.msF9yv6K-lkp@intel.com/
> 
> smatch warnings:
> fs/smb/client/cifsacl.c:1514 set_cifs_acl() error: uninitialized symbol 'access_flags'.

Hello, I have already figured it out and wrote to the list:
https://lore.kernel.org/linux-cifs/20241227144343.volpdup7xx6xlsiq@pali/T/#u

> vim +/access_flags +1514 fs/smb/client/cifsacl.c
> 
> 3651487607ae77 fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  1486  int set_cifs_acl(struct smb_ntsd *pnntsd, __u32 acllen,
> a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1487  			struct inode *inode, const char *path, int aclflag)
> b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1488  {
> b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1489  	int oplock = 0;
> 6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1490  	unsigned int xid;
> 0f060936e490c6 fs/cifs/cifsacl.c       Amir Goldstein     2020-02-03  1491  	int rc, access_flags;
> 96daf2b09178d8 fs/cifs/cifsacl.c       Steve French       2011-05-27  1492  	struct cifs_tcon *tcon;
> a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1493  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
> 7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1494  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
> d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1495  	struct cifs_fid fid;
> d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1496  	struct cifs_open_parms oparms;
> 7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1497  
> 7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1498  	if (IS_ERR(tlink))
> 7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1499  		return PTR_ERR(tlink);
> 97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1500  
> 7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1501  	tcon = tlink_tcon(tlink);
> 6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1502  	xid = get_xid();
> 97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1503  
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1504  	if (aclflag & CIFS_ACL_OWNER || aclflag & CIFS_ACL_GROUP)
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1505  		access_flags |= WRITE_OWNER;
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1506  	if (aclflag & CIFS_ACL_SACL)
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1507  		access_flags |= SYSTEM_SECURITY;
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1508  	if (aclflag & CIFS_ACL_DACL)
> ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1509  		access_flags |= WRITE_DAC;
> 
> What if the permisions are 000?

Then it means "no permission". And SMB server refuses opening file/dir
with "no permission". And in case the buggy server opens it, then kernel
would ask to do "no operation" as no update flag would be set.

But in any case, calling this ->set_acl() callback with zero or invalid
aclflag is an error, so the callback would return error from server.

Now I check that no kernel code is calling ->set_acl() with zero /
invalid flags.

So basically, it is just a compiler false-positive warning, not a real
error in a code. But of course I will include the fixup from the list in
next version.

Anyway, same logic is in set_smb2_acl implementation of ->set_acl()
callback. So I think it is safe.

> a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1510  
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1511  	oparms = (struct cifs_open_parms) {
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1512  		.tcon = tcon,
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1513  		.cifs_sb = cifs_sb,
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11 @1514  		.desired_access = access_flags,
>                                                                                                           ^^^^^^^^^^^^
> warning
> 
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1515  		.create_options = cifs_create_options(cifs_sb, 0),
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1516  		.disposition = FILE_OPEN,
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1517  		.path = path,
> de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1518  		.fid = &fid,
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
