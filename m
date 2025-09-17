Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600BB2BEC42;
	Wed, 17 Sep 2025 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758111725; cv=none; b=XtL5hjMp4GcsanNjAkxurI5X19lKfVAjrzizvZeUnFfEy6wYJaDnd7HMCMwDPRpchEtYDMKdoUQAHH0PZF50eF1EKzklbTXfefA+wnnw5vffPrzKI5jBlRmH5ZUQHAlHtwrq5MLQ+Mbi+Emvq+k6E+6Yyc8EL8QQ8C7TcTWJf/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758111725; c=relaxed/simple;
	bh=lo9+ZBcKSuW881kJggPgSGJcNqWm9Uuz05kOy3whZZ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DLEj3rMqgpD1d4vInaXna36bnwk3kcF8OEykqY/CktTfb2FoWSeuroUzbGYdgZxCz67BUK9enosILq2K+uDgbCMHQqQAGF/AxtYjThb/xu+Hn53WDR/a2euu9TTDI++LpWrZVNx62QrECsNltnRiGz91Awr6FaNjCRbk/SEo1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sx046GRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sx046GRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E16C4CEF0;
	Wed, 17 Sep 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758111724;
	bh=lo9+ZBcKSuW881kJggPgSGJcNqWm9Uuz05kOy3whZZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=sx046GRERa2/gVVPujGsTp2uYdTEYXsoRnVppt+dwTseD2EJ0Azt4UX8ZKKlcKPiJ
	 JGMgb6N3+6BeNXmkeIW6UcflTmT1BpLH0EKBagYVqDamNMENS4VbLk8bOGQSpPaXac
	 jYu6blr4qLe3BEn7CbTN30llrcfEw6w+3TqgaRLBQGHjbQHtD2cCWQLJHylGH9AGHH
	 SWW6Ur8HMasAWoVBKgfuqqp9zsONm7KvYB8RjEd8QixTLUx4NVUNbcXyoYvwQqOefm
	 AD39DrUN0tNWRP+8IW9fS5ETytPRAXp/6NxbxLZOnyAILjYuhwI9ZeglunIP2sDdM4
	 k3nFtm9v0qkJw==
Message-ID: <1462b85e8a47fc64e64aee89c48c38078d6d818a.camel@kernel.org>
Subject: Re: [PATCH v2] nfsd: move name lookup out of nfsd4_list_rec_dir()
From: Jeff Layton <jlayton@kernel.org>
To: NeilBrown <neil@brown.name>, Chuck Lever <chuck.lever@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Date: Wed, 17 Sep 2025 08:22:03 -0400
In-Reply-To: <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
References: <202509131751.4STnDcZg-lkp@intel.com>
	, <175781199938.1696783.3669146136396360246@noble.neil.brown.name>
	, <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>
	, <175788975119.1696783.10090163184150858167@noble.neil.brown.name>
	, <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
	 <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-09-15 at 12:55 +1000, NeilBrown wrote:
> nfsd4_list_rec_dir() is called with two different callbacks.
> One of the callbacks uses vfs_rmdir() to remove the directory.
> The other doesn't use the dentry at all, just the name.
>=20
> As only one callback needs the dentry, this patch moves the lookup into
> that callback.  This prepares of changes to how directory operations
> are locked.
>=20
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>=20
> This time with the fix applied to the right patch :-(
>=20
>  fs/nfsd/nfs4recover.c | 54 +++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
>=20
> diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
> index e2b9472e5c78..e9d09541161c 100644
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@ -237,7 +237,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
>  	nfs4_reset_creds(original_cred);
>  }
> =20
> -typedef int (recdir_func)(struct dentry *, struct dentry *, struct nfsd_=
net *);
> +typedef int (recdir_func)(struct dentry *, char *, struct nfsd_net *);
> =20
>  struct name_list {
>  	char name[HEXDIR_LEN];
> @@ -291,24 +291,14 @@ nfsd4_list_rec_dir(recdir_func *f, struct nfsd_net =
*nn)
>  	}
> =20
>  	status =3D iterate_dir(nn->rec_file, &ctx.ctx);
> -	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
> =20
>  	list_for_each_entry_safe(entry, tmp, &ctx.names, list) {
> -		if (!status) {
> -			struct dentry *dentry;
> -			dentry =3D lookup_one(&nop_mnt_idmap,
> -					    &QSTR(entry->name), dir);
> -			if (IS_ERR(dentry)) {
> -				status =3D PTR_ERR(dentry);
> -				break;
> -			}
> -			status =3D f(dir, dentry, nn);
> -			dput(dentry);
> -		}
> +		if (!status)
> +			status =3D f(dir, entry->name, nn);
> +
>  		list_del(&entry->list);
>  		kfree(entry);
>  	}
> -	inode_unlock(d_inode(dir));
>  	nfs4_reset_creds(original_cred);
> =20
>  	list_for_each_entry_safe(entry, tmp, &ctx.names, list) {
> @@ -406,18 +396,19 @@ nfsd4_remove_clid_dir(struct nfs4_client *clp)
>  }
> =20
>  static int
> -purge_old(struct dentry *parent, struct dentry *child, struct nfsd_net *=
nn)
> +purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
>  {
>  	int status;
> +	struct dentry *child;
>  	struct xdr_netobj name;
> =20
> -	if (child->d_name.len !=3D HEXDIR_LEN - 1) {
> -		printk("%s: illegal name %pd in recovery directory\n",
> -				__func__, child);
> +	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
> +		printk("%s: illegal name %s in recovery directory\n",
> +				__func__, cname);
>  		/* Keep trying; maybe the others are OK: */
>  		return 0;
>  	}
> -	name.data =3D kmemdup_nul(child->d_name.name, child->d_name.len, GFP_KE=
RNEL);
> +	name.data =3D kstrdup(cname, GFP_KERNEL);
>  	if (!name.data) {
>  		dprintk("%s: failed to allocate memory for name.data!\n",
>  			__func__);
> @@ -427,10 +418,17 @@ purge_old(struct dentry *parent, struct dentry *chi=
ld, struct nfsd_net *nn)
>  	if (nfs4_has_reclaimed_state(name, nn))
>  		goto out_free;
> =20
> -	status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
> -	if (status)
> -		printk("failed to remove client recovery directory %pd\n",
> -				child);
> +	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
> +	child =3D lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
> +	if (!IS_ERR(child)) {
> +		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
> +		if (status)
> +			printk("failed to remove client recovery directory %pd\n",
> +			       child);
> +		dput(child);
> +	}
> +	inode_unlock(d_inode(parent));
> +
>  out_free:
>  	kfree(name.data);
>  out:
> @@ -461,18 +459,18 @@ nfsd4_recdir_purge_old(struct nfsd_net *nn)
>  }
> =20
>  static int
> -load_recdir(struct dentry *parent, struct dentry *child, struct nfsd_net=
 *nn)
> +load_recdir(struct dentry *parent, char *cname, struct nfsd_net *nn)
>  {
>  	struct xdr_netobj name;
>  	struct xdr_netobj princhash =3D { .len =3D 0, .data =3D NULL };
> =20
> -	if (child->d_name.len !=3D HEXDIR_LEN - 1) {
> -		printk("%s: illegal name %pd in recovery directory\n",
> -				__func__, child);
> +	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
> +		printk("%s: illegal name %s in recovery directory\n",
> +				__func__, cname);
>  		/* Keep trying; maybe the others are OK: */
>  		return 0;
>  	}
> -	name.data =3D kmemdup_nul(child->d_name.name, child->d_name.len, GFP_KE=
RNEL);
> +	name.data =3D kstrdup(cname, GFP_KERNEL);
>  	if (!name.data) {
>  		dprintk("%s: failed to allocate memory for name.data!\n",
>  			__func__);

Reviewed-by: Jeff Layton <jlayton@kernel.org>
