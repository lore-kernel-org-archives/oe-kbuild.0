Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C48331215
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450249; cv=none; b=l0cc2e0tXgS2VQVVrJzSL4We4AkLv/utS/D/Aj9vz5fl0tAZh5jV7lr7oLCGWkqR+UkHlcsm16vFy/hIwuBH5c/0Wd6zdh51OWRfo1tpKs7GDlsddrDG3w3EtfBpZ5vAa9B2t9KoSnGSOCZPpFtIGl8xZBszj5AZwofulbHXfnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450249; c=relaxed/simple;
	bh=9je2vzVvmtDnuHThA0jXAb2rfvHFErguZIVNmRYClIU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=gNP1gOzOVqBmz++/TsW14QFfnIKgjSZFBsQcOzx3EhWmYgACSVwZEWYanAigJe5iDK6yOwhrlV0Y5DhK0RE1DDe9qKM94U+/sfaFmWhTu+IeNUzl7w3aZRTHmgYhKCgkgtUOFy1wbxcUvsoIfPUACXN4btklC1Tn3qoHRZ4L4DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJgIS8KB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJgIS8KB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772450246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLVPOyaWslcAM2zCXXGtXo8fCMopkqqWHLE8OBk4ANw=;
	b=PJgIS8KByZwaauSxtGrMUzTvDF5knXoNst9bvhdEugAhI8+5gLkatMamRGGfGGgkf3DiD9
	ChHa8zWOL9kirRPZhrir1gOaix/NHcdvgcE3ZV6slmJoRVKSa58Fne7tBFHuKuqfEV8TjV
	4aEB2IO2PIfhnLp487Sm4fVVg/tYkCw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-OvMZ13qDOLeOE3ntGioR8Q-1; Mon,
 02 Mar 2026 06:17:23 -0500
X-MC-Unique: OvMZ13qDOLeOE3ntGioR8Q-1
X-Mimecast-MFC-AGG-ID: OvMZ13qDOLeOE3ntGioR8Q_1772450242
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D38E61800348;
	Mon,  2 Mar 2026 11:17:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.45.224.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14F901800348;
	Mon,  2 Mar 2026 11:17:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202603011243.LsWeX4QE-lkp@intel.com>
References: <202603011243.LsWeX4QE-lkp@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-next 10/16] fs/netfs/write_issue.c:850 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 11:17:19 +0000
Message-ID: <1276684.1772450239@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cmzPFglciQpUoZyEytxLpYnspTuGBWoYUhNF29itGOw_1772450242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1276683.1772450239.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

>   	if (!mutex_trylock(&ictx->wb_lock)) {
>   		if (wbc->sync_mode == WB_SYNC_NONE) {
>   			netfs_stat(&netfs_n_wb_lock_skip);
>   			return 0;
> 
> Unlock before returning?

If mutex_trylock() returns false, we don't have the lock.  Note that it's a
"try" so it's not guaranteed to work.

David

