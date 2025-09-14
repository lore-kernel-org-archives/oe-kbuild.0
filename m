Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A02DC763;
	Sun, 14 Sep 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757889761; cv=none; b=ln17658HYBNDzKIAubAmKei4dqQSzG4Ox2WU0bEiLSCNqPoluWaF21HdbEupXJ601N0uQSKKH+J04hqK99bgrLZplBXc7+NkWQqtW26pQjV+5BbOMY7MwNi7Lsmn7J/agoiBmyk1XOf9bYlWS2T+ccdqsD7/tjIhgW7myc62QPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757889761; c=relaxed/simple;
	bh=bOD4Zc51zBxldu6JWhL3d9IF6JkHUDQ8l5R6NelUUc0=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=hupbsc9vn3idoWose7r+p31hlv110V/CTnDKalHsSCGRRhpK3O9D+0JKZI9zZyN9BF1VGSIA03g092SUHiYyFsdbsaaNumYeMLJcCbeIFLN8VsmzgBAmu33COu5B9RqRmg6/Bz8xVsz1JnDz7kbR90QRfGmtq5X/+5KVAlZi7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=a6X9kl9R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IcsGDdEQ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="a6X9kl9R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IcsGDdEQ"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8695914001A3;
	Sun, 14 Sep 2025 18:42:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 14 Sep 2025 18:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1757889757; x=1757976157; bh=bMAoKvl4YbC9OHZGIij5+hk9/9U8LfPm+RF
	+NHHgRmo=; b=a6X9kl9Rg2jFJeWJFPwb0c8gQyvCvaXfRI1SpSt/GAnpkz0tsbe
	U8IX+Ftl00e/VeKlCoqlhTuafC/syTk1dubpKz0VYWhMqf4n1McATTxGM+8RJcYD
	mCIJhcUg76D5up/JdtUmd8FsPyZSOADoEeTeEc/3O88OJpvmY9ETkF6dTpNa5Met
	Wk+bmkA9JKmUWZbiLQd/a2wDNCIXYJbaerLUsmGLedhAufhn0RQKVFkDmpAnzWJg
	MJTUKyBVcr+eb2hazInHo9r5TFoDitG57uVbsgZ/88ePDA/nHmlULRRQy56Vl4ra
	zyoZlgmDHZaejqVdbaGtxys6pebO603+PPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757889757; x=
	1757976157; bh=bMAoKvl4YbC9OHZGIij5+hk9/9U8LfPm+RF+NHHgRmo=; b=I
	csGDdEQ/gnNQ2rBCDGEfHhe9NylCONRQdRrxGjBiiGDtdiyIAqaLivczAmxqB70a
	5ewmcUemuUN2VTlNf+lfy29zVWMmTU9nzz/0LDwJwHk1nK4y9SyNoKXQh+dfHuN6
	bzN+aMEyRSojkEMlkhbKIewEc17FHKnxaGgYMhNXJpH0Sg/Ev3fdbvPz/D81QeaK
	Polbo5PHwlzI6Vi3pFM7GE5oMt8DlYVU3oBu4TOGgRkrgBBSUyd/hxQ1cUBevlET
	B5SIxaYl7+f4unzXk5+rwMGGpB9Rkna3Kf3m2V1/Pd7qXXKQ9oRnfTPWY6KiBOr2
	2X7e5itOYMSyooKQ5zMLQ==
X-ME-Sender: <xms:3ETHaEsBaKo36IxnNrVKo7jzZGAVoqSOjV0Rd2mY8Q2lZmMIgXFoKA>
    <xme:3ETHaCO-C6HDk6A1sqBAMUTLJsyp-5Q7engUJK6g-iWNkqyVk2WQfi0zAp26goWUd
    oVrptdx-Je1Lw>
X-ME-Received: <xmr:3ETHaL6FR1DVKZFgTcgI_ajY3LmoZlEt3gG__kjcMXQaqDBisvIOx7_N3oBV53-OXKIvCvX4IErTYN1dKOB2gcS6AVVjdYKOdkgrQweorxA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefiedtgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:3ETHaIQczY34laAxmW1s_QZir8hd3STCir8wb-99k-8rXhdFhW25VQ>
    <xmx:3ETHaIDAcWjVkJyq7cA40G5CdyTkbLST_k3pjy1u54eXYNGwEX2Jtg>
    <xmx:3ETHaIHSpQwNYB8l_Mbo1YfLyOtRIMLuhPJoswCH6ty56P7zQQlI4g>
    <xmx:3ETHaCD1VdmSJMr0eEitVTp6zzm4q1FvE4gwYc8sFpGYPayJuRtmxA>
    <xmx:3UTHaO-mG4Bo1zAAxSEQtbBOzb1isS9-b5L25ags-c4lKP7UEDRUBDy1>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 18:42:34 -0400 (EDT)
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
Subject: [PATCH v2] nfsd: change nfs4_client_to_reclaim() to allocate data
In-reply-to: <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>
References: <202509131751.4STnDcZg-lkp@intel.com>,
 <175781199938.1696783.3669146136396360246@noble.neil.brown.name>,
 <35db1d4a-c75f-4419-b0a5-71ef0f80603c@oracle.com>
Date: Mon, 15 Sep 2025 08:42:31 +1000
Message-id: <175788975119.1696783.10090163184150858167@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>


The calling convention for nfs4_client_to_reclaim() is clumsy in that
the caller need to free memory if the function fails.  It is much
cleaner if the function frees its own memory.

This patch changes nfs4_client_to_reclaim() to re-allocate the .data
fields to be stored in the newly allocated struct nfs4_client_reclaim,
and to free everything on failure.

__cld_pipe_inprogress_downcall() needs to allocate the data anyway to
copy it from user-space, so now that data is allocated twice.  I think
that is a small price to pay for a cleaner interface.

Signed-off-by: NeilBrown <neil@brown.name>
---

This version fixes the problem Dan found with "child" being used
uninitialised in "purge_old()".

 fs/nfsd/nfs4recover.c | 71 +++++++++++++++----------------------------
 fs/nfsd/nfs4state.c   | 22 ++++++++++++--
 2 files changed, 44 insertions(+), 49 deletions(-)

diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index 990fe3d958ed..b1005abcb903 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -147,24 +147,13 @@ legacy_recdir_name_error(struct nfs4_client *clp, int e=
rror)
=20
 static void
 __nfsd4_create_reclaim_record_grace(struct nfs4_client *clp,
-		const char *dname, int len, struct nfsd_net *nn)
+				    char *dname, struct nfsd_net *nn)
 {
-	struct xdr_netobj name;
+	struct xdr_netobj name =3D { .len =3D strlen(dname), .data =3D dname };
 	struct xdr_netobj princhash =3D { .len =3D 0, .data =3D NULL };
 	struct nfs4_client_reclaim *crp;
=20
-	name.data =3D kmemdup(dname, len, GFP_KERNEL);
-	if (!name.data) {
-		dprintk("%s: failed to allocate memory for name.data!\n",
-			__func__);
-		return;
-	}
-	name.len =3D len;
 	crp =3D nfs4_client_to_reclaim(name, princhash, nn);
-	if (!crp) {
-		kfree(name.data);
-		return;
-	}
 	crp->cr_clp =3D clp;
 }
=20
@@ -223,8 +212,7 @@ nfsd4_create_clid_dir(struct nfs4_client *clp)
 	inode_unlock(d_inode(dir));
 	if (status =3D=3D 0) {
 		if (nn->in_grace)
-			__nfsd4_create_reclaim_record_grace(clp, dname,
-					HEXDIR_LEN, nn);
+			__nfsd4_create_reclaim_record_grace(clp, dname, nn);
 		vfs_fsync(nn->rec_file, 0);
 	} else {
 		printk(KERN_ERR "NFSD: failed to write recovery record"
@@ -403,8 +391,8 @@ purge_old(struct dentry *parent, char *cname, struct nfsd=
_net *nn)
 	struct xdr_netobj name;
=20
 	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
-		printk("%s: illegal name %pd in recovery directory\n",
-				__func__, child);
+		printk("%s: illegal name %s in recovery directory\n",
+				__func__, cname);
 		/* Keep trying; maybe the others are OK: */
 		return 0;
 	}
@@ -461,7 +449,7 @@ nfsd4_recdir_purge_old(struct nfsd_net *nn)
 static int
 load_recdir(struct dentry *parent, char *cname, struct nfsd_net *nn)
 {
-	struct xdr_netobj name;
+	struct xdr_netobj name =3D { .len =3D HEXDIR_LEN, .data =3D cname };
 	struct xdr_netobj princhash =3D { .len =3D 0, .data =3D NULL };
=20
 	if (strlen(cname) !=3D HEXDIR_LEN - 1) {
@@ -470,16 +458,7 @@ load_recdir(struct dentry *parent, char *cname, struct n=
fsd_net *nn)
 		/* Keep trying; maybe the others are OK: */
 		return 0;
 	}
-	name.data =3D kstrdup(cname, GFP_KERNEL);
-	if (!name.data) {
-		dprintk("%s: failed to allocate memory for name.data!\n",
-			__func__);
-		goto out;
-	}
-	name.len =3D HEXDIR_LEN;
-	if (!nfs4_client_to_reclaim(name, princhash, nn))
-		kfree(name.data);
-out:
+	nfs4_client_to_reclaim(name, princhash, nn);
 	return 0;
 }
=20
@@ -777,6 +756,8 @@ __cld_pipe_inprogress_downcall(const struct cld_msg_v2 __=
user *cmsg,
 {
 	uint8_t cmd, princhashlen;
 	struct xdr_netobj name, princhash =3D { .len =3D 0, .data =3D NULL };
+	char *namecopy __free(kfree) =3D NULL;
+	char *princhashcopy __free(kfree) =3D NULL;
 	uint16_t namelen;
=20
 	if (get_user(cmd, &cmsg->cm_cmd)) {
@@ -794,19 +775,19 @@ __cld_pipe_inprogress_downcall(const struct cld_msg_v2 =
__user *cmsg,
 				dprintk("%s: invalid namelen (%u)", __func__, namelen);
 				return -EINVAL;
 			}
-			name.data =3D memdup_user(&ci->cc_name.cn_id, namelen);
-			if (IS_ERR(name.data))
-				return PTR_ERR(name.data);
+			namecopy =3D memdup_user(&ci->cc_name.cn_id, namelen);
+			if (IS_ERR(namecopy))
+				return PTR_ERR(namecopy);
+			name.data =3D namecopy;
 			name.len =3D namelen;
 			get_user(princhashlen, &ci->cc_princhash.cp_len);
 			if (princhashlen > 0) {
-				princhash.data =3D memdup_user(
-						&ci->cc_princhash.cp_data,
-						princhashlen);
-				if (IS_ERR(princhash.data)) {
-					kfree(name.data);
-					return PTR_ERR(princhash.data);
-				}
+				princhashcopy =3D memdup_user(
+					&ci->cc_princhash.cp_data,
+					princhashlen);
+				if (IS_ERR(princhashcopy))
+					return PTR_ERR(princhashcopy);
+				princhash.data =3D princhashcopy;
 				princhash.len =3D princhashlen;
 			} else
 				princhash.len =3D 0;
@@ -820,9 +801,10 @@ __cld_pipe_inprogress_downcall(const struct cld_msg_v2 _=
_user *cmsg,
 				dprintk("%s: invalid namelen (%u)", __func__, namelen);
 				return -EINVAL;
 			}
-			name.data =3D memdup_user(&cnm->cn_id, namelen);
-			if (IS_ERR(name.data))
-				return PTR_ERR(name.data);
+			namecopy =3D memdup_user(&cnm->cn_id, namelen);
+			if (IS_ERR(namecopy))
+				return PTR_ERR(namecopy);
+			name.data =3D namecopy;
 			name.len =3D namelen;
 		}
 #ifdef CONFIG_NFSD_LEGACY_CLIENT_TRACKING
@@ -830,15 +812,12 @@ __cld_pipe_inprogress_downcall(const struct cld_msg_v2 =
__user *cmsg,
 			struct cld_net *cn =3D nn->cld_net;
=20
 			name.len =3D name.len - 5;
-			memmove(name.data, name.data + 5, name.len);
+			name.data =3D name.data + 5;
 			cn->cn_has_legacy =3D true;
 		}
 #endif
-		if (!nfs4_client_to_reclaim(name, princhash, nn)) {
-			kfree(name.data);
-			kfree(princhash.data);
+		if (!nfs4_client_to_reclaim(name, princhash, nn))
 			return -EFAULT;
-		}
 		return nn->client_tracking_ops->msglen;
 	}
 	return -EFAULT;
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index e45f67924bd0..fa073353f30b 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -8801,9 +8801,6 @@ nfs4_has_reclaimed_state(struct xdr_netobj name, struct=
 nfsd_net *nn)
=20
 /*
  * failure =3D> all reset bets are off, nfserr_no_grace...
- *
- * The caller is responsible for freeing name.data if NULL is returned (it
- * will be freed in nfs4_remove_reclaim_record in the normal case).
  */
 struct nfs4_client_reclaim *
 nfs4_client_to_reclaim(struct xdr_netobj name, struct xdr_netobj princhash,
@@ -8812,6 +8809,22 @@ nfs4_client_to_reclaim(struct xdr_netobj name, struct =
xdr_netobj princhash,
 	unsigned int strhashval;
 	struct nfs4_client_reclaim *crp;
=20
+	name.data =3D kmemdup(name.data, name.len, GFP_KERNEL);
+	if (!name.data) {
+		dprintk("%s: failed to allocate memory for name.data!\n",
+			__func__);
+		return NULL;
+	}
+	if (princhash.len) {
+		princhash.data =3D kmemdup(princhash.data, princhash.len, GFP_KERNEL);
+		if (!princhash.data) {
+			dprintk("%s: failed to allocate memory for princhash.data!\n",
+				__func__);
+			kfree(name.data);
+			return NULL;
+		}
+	} else
+		princhash.data =3D NULL;
 	crp =3D alloc_reclaim();
 	if (crp) {
 		strhashval =3D clientstr_hashval(name);
@@ -8823,6 +8836,9 @@ nfs4_client_to_reclaim(struct xdr_netobj name, struct x=
dr_netobj princhash,
 		crp->cr_princhash.len =3D princhash.len;
 		crp->cr_clp =3D NULL;
 		nn->reclaim_str_hashtbl_size++;
+	} else {
+		kfree(name.data);
+		kfree(princhash.data);
 	}
 	return crp;
 }

base-commit: b8cf39957931982091e6446a98f151a79aeea07b
prerequisite-patch-id: cf499d1388be776efe8f32ad8e6cd758bf3944da
prerequisite-patch-id: 7a60f48240b09e24d2b1a3ddac945c09aa0bb8d6
--=20
2.50.0.107.gf914562f5916.dirty

