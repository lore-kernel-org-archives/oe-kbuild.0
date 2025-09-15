Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8BBD27E;
	Mon, 15 Sep 2025 02:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757904919; cv=none; b=DyNaDElO/eaDfwaw/+BVXOkcDOVLiZS51BqaQ9+Qmv/qhkdH0EunBy2ppkNIuQFg/DroCCbEydc1LbBdgNNI+zYAmDb+yqAWV19uIOvI9vvtqO3jStU9cuu8I3Zc5Yc8W4y565qzvvbVzn/x8yxhmDkxxfGD6IpcTX5/QWeO3Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757904919; c=relaxed/simple;
	bh=IcWSfeIOE297IVqGKoD6IECaR09iGnU05NU8FxKyW1U=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=RV/wJwGhwy/MWFVP7kb/ajCcMpMvpig4w5pSnO4gWAF0tRETaesiffZ9//597sCwbxPWJRaeXFeJH3G3Y1yep+VCAITOJ+U3k7wpSG583+50skWMmLxzqXKWaTCdooUNNqaXAzWVvCyqynnBYtKDQ2dgr9hSyMZaYSwyrhTmrnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=hbivKRhD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nqHqD94O; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="hbivKRhD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nqHqD94O"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 4BA821D0006F;
	Sun, 14 Sep 2025 22:55:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 14 Sep 2025 22:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1757904917; x=1757991317; bh=bfaOXEdDqa5GrRfrxNxCth59U70Zc4uwsfT
	eXy42sfA=; b=hbivKRhD/jj+ktNHZEYzQtfgzjMo0OX05brRabYP4+kz5mUSALQ
	Tna7rhq7p2nUt1dqhV+PE9ZUnjhLsAYTk+doj4sWhmFUqY9yAizbKxD7DEIypswO
	6+wGcP3JLZZFIw6vRLJ7YI/yoQtUB18rnloubyZICd/h/qxgiQyzsr64wrhAIgNT
	3Z4GrSd3z0ZFI3aQvZ6EImrWcCh1mZn1O33nfFHR/pg1kiHc9kXS490FnaDqvxgI
	2IfbQiNuB1/wblzV79vaCyR8oSa3oRyTgxScgAJf7j56RUSAZurvcrgZNCvdXyoC
	59kLLBIEQqd/NRbeLw3GWBeogeHtdKCTazg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757904917; x=
	1757991317; bh=bfaOXEdDqa5GrRfrxNxCth59U70Zc4uwsfTeXy42sfA=; b=n
	qHqD94OZhyo+W0Sz9GiFnxeT88jO+W4JJlEplfxBLBwlb3KvEVbILdEcqZ46pXNW
	xWPpktVt9HgfC3PurKK5FSqSkqdYpt2Xqb8meClCnb6SgoqcNM2XimMOK+1GK/xV
	4/JjL6HyNssW/p5h8SR2xm8d6N6mmhDL0OQW0u1iZs7gFuYKU5txTRHGcrxHxAu/
	W0FXvqjaIZwBcEEHXy9U+qju3dlLMK4JDxeMBo2TEWN+fqBtFNj0JXgCDM5zsaHO
	nNvmV2aUQ/qIRlRYRWxU1+fIE79IvsBzyMGcK1T7jNx0eY7O6bOJidcFgSsV54Fc
	AaKq9WGP3iIZzghFI+gaA==
X-ME-Sender: <xms:FIDHaAy_WQxV3hbgJFzqZ8kTME8DDQllNRQiJrnncuSil07-Zlt3bg>
    <xme:FIDHaFDvYNGhszcVixnzAt0K3J5Gu0VhOSzQ9nRAlJcwucrxTGkJ3X5k8tRy8grjQ
    ZmqxeCEp7bESw>
X-ME-Received: <xmr:FIDHaOfjN8rhquWdCepMO4QMrpZrfWB8XRL-5ghxZ2JmEPr8RYZaPQ6wDaQLfiO7OtMtcgIsr8Cs2jUekZmzv2X6VF9XAza--Z3EBoCj8x3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffkrhesthhqredttddtjeenucfhrhhomheppfgvihhluehr
    ohifnhcuoehnvghilhgssehofihnmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    eljedtfeegueekieetudevheduveefffevudetgfetudfhgedvgfdtieeguedujeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnvghilhgsse
    hofihnmhgrihhlrdhnvghtpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegthhhutghkrdhlvghvvghrsehorhgrtghlvgdrtghomhdprhgtph
    htthhopehovgdqkhgsuhhilhgusehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthht
    ohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehjlhgrhihtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvg
    hlrdgtohhm
X-ME-Proxy: <xmx:FIDHaPkJislqiuYz_tkpi6Mn5PFZkqDeAtWjEbUHBDSy2yMZeyv1vQ>
    <xmx:FIDHaFH5FfNFJFpYocPU3fxcBD7KMI82lyOVVtlosWX6wf2PbgXHJQ>
    <xmx:FIDHaH7JST6voGwG1gLSG2vp0f-QTBWblYVNWLr9J2gH5wxZO-vKAw>
    <xmx:FIDHaNlsSWOCJB_UDq8jprZQqRtd37qE_qgVl9TReNNv14cQ2TgsxA>
    <xmx:FYDHaGiQyEYAINQyvSXftIp7ukOWo9XnJvRaVDEU3HojaiAb23uZC0av>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 22:55:14 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Chuck Lever" <chuck.lever@oracle.com>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 "Jeff Layton" <jlayton@kernel.org>
Subject: [PATCH v2] nfsd: move name lookup out of nfsd4_list_rec_dir()
In-reply-to: <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
References: <202509131751.4STnDcZg-lkp@intel.com>,
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>,
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>,
 <175788975119.1696783.10090163184150858167@noble.neil.brown.name>,
 <b89886a8-c6f3-4789-bf03-4e8da7e142db@oracle.com>
Date: Mon, 15 Sep 2025 12:55:13 +1000
Message-id: <175790491325.1696783.7680474323247431624@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>


nfsd4_list_rec_dir() is called with two different callbacks.
One of the callbacks uses vfs_rmdir() to remove the directory.
The other doesn't use the dentry at all, just the name.

As only one callback needs the dentry, this patch moves the lookup into
that callback.  This prepares of changes to how directory operations
are locked.

Signed-off-by: NeilBrown <neil@brown.name>
---

This time with the fix applied to the right patch :-(

 fs/nfsd/nfs4recover.c | 54 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index e2b9472e5c78..e9d09541161c 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -237,7 +237,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
 	nfs4_reset_creds(original_cred);
 }
=20
-typedef int (recdir_func)(struct dentry *, struct dentry *, struct nfsd_net =
*);
+typedef int (recdir_func)(struct dentry *, char *, struct nfsd_net *);
=20
 struct name_list {
 	char name[HEXDIR_LEN];
@@ -291,24 +291,14 @@ nfsd4_list_rec_dir(recdir_func *f, struct nfsd_net *nn)
 	}
=20
 	status =3D iterate_dir(nn->rec_file, &ctx.ctx);
-	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
=20
 	list_for_each_entry_safe(entry, tmp, &ctx.names, list) {
-		if (!status) {
-			struct dentry *dentry;
-			dentry =3D lookup_one(&nop_mnt_idmap,
-					    &QSTR(entry->name), dir);
-			if (IS_ERR(dentry)) {
-				status =3D PTR_ERR(dentry);
-				break;
-			}
-			status =3D f(dir, dentry, nn);
-			dput(dentry);
-		}
+		if (!status)
+			status =3D f(dir, entry->name, nn);
+
 		list_del(&entry->list);
 		kfree(entry);
 	}
-	inode_unlock(d_inode(dir));
 	nfs4_reset_creds(original_cred);
=20
 	list_for_each_entry_safe(entry, tmp, &ctx.names, list) {
@@ -406,18 +396,19 @@ nfsd4_remove_clid_dir(struct nfs4_client *clp)
 }
=20
 static int
-purge_old(struct dentry *parent, struct dentry *child, struct nfsd_net *nn)
+purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
 {
 	int status;
+	struct dentry *child;
 	struct xdr_netobj name;
=20
-	if (child->d_name.len !=3D HEXDIR_LEN - 1) {
-		printk("%s: illegal name %pd in recovery directory\n",
-				__func__, child);
+	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
+		printk("%s: illegal name %s in recovery directory\n",
+				__func__, cname);
 		/* Keep trying; maybe the others are OK: */
 		return 0;
 	}
-	name.data =3D kmemdup_nul(child->d_name.name, child->d_name.len, GFP_KERNEL=
);
+	name.data =3D kstrdup(cname, GFP_KERNEL);
 	if (!name.data) {
 		dprintk("%s: failed to allocate memory for name.data!\n",
 			__func__);
@@ -427,10 +418,17 @@ purge_old(struct dentry *parent, struct dentry *child, =
struct nfsd_net *nn)
 	if (nfs4_has_reclaimed_state(name, nn))
 		goto out_free;
=20
-	status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
-	if (status)
-		printk("failed to remove client recovery directory %pd\n",
-				child);
+	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
+	child =3D lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
+	if (!IS_ERR(child)) {
+		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
+		if (status)
+			printk("failed to remove client recovery directory %pd\n",
+			       child);
+		dput(child);
+	}
+	inode_unlock(d_inode(parent));
+
 out_free:
 	kfree(name.data);
 out:
@@ -461,18 +459,18 @@ nfsd4_recdir_purge_old(struct nfsd_net *nn)
 }
=20
 static int
-load_recdir(struct dentry *parent, struct dentry *child, struct nfsd_net *nn)
+load_recdir(struct dentry *parent, char *cname, struct nfsd_net *nn)
 {
 	struct xdr_netobj name;
 	struct xdr_netobj princhash =3D { .len =3D 0, .data =3D NULL };
=20
-	if (child->d_name.len !=3D HEXDIR_LEN - 1) {
-		printk("%s: illegal name %pd in recovery directory\n",
-				__func__, child);
+	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
+		printk("%s: illegal name %s in recovery directory\n",
+				__func__, cname);
 		/* Keep trying; maybe the others are OK: */
 		return 0;
 	}
-	name.data =3D kmemdup_nul(child->d_name.name, child->d_name.len, GFP_KERNEL=
);
+	name.data =3D kstrdup(cname, GFP_KERNEL);
 	if (!name.data) {
 		dprintk("%s: failed to allocate memory for name.data!\n",
 			__func__);
--=20
2.50.0.107.gf914562f5916.dirty

