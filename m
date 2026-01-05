Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813B306D40;
	Mon,  5 Jan 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626573; cv=none; b=six6+E4ktD5wgkuEa1WKQ/MYYCLBg3IS8iRGtCF2Wn5iRCb9TrJnHaTY0FxvDNeaphIzwLXNfI6aZGFO4OEJqAg/CUxTNIZbrgEZAGmUPP5DICDqZRN/taQ4I2TkK3QYdaY16nCW3axU9BHndR+QLXKOxPIo53rY+Czj+i+sAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626573; c=relaxed/simple;
	bh=Y/61Lc/3ixM0IjH03owoY/4B/u8hH7rmI7wXDaMatUU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPchlND+KDGs6jBWvWVb5cQ7C5XHL9yejFJlQw4IfdNXdPobj1DCmS+eM0aIKgti3fnQBfcLmgglt7V+hRHtR5hsdHzxO8AIGSvEc75KuqbrjhX5xMDEFI9lglz/ZqzMb8iCMCgfpwvsSMMgjn3zDNbp6wl1bmmR+BuJ3/WYo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E096C56F00;
	Mon,  5 Jan 2026 15:22:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id B09971B;
	Mon,  5 Jan 2026 15:22:42 +0000 (UTC)
Date: Mon, 5 Jan 2026 10:23:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error:
 we previously assumed 'fregs' could be null (see line 830)
Message-ID: <20260105102304.54559915@gandalf.local.home>
In-Reply-To: <aVvVrFgh8ieFVbn4@stanley.mountain>
References: <202512131657.JQUt5fXQ-lkp@intel.com>
	<20260102120913.15e5fc1b@gandalf.local.home>
	<20260105111355.47965a0e4d52b0ffdc102330@kernel.org>
	<aVvVrFgh8ieFVbn4@stanley.mountain>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B09971B
X-Stat-Signature: ytzafm95thwub4bwdk3boecbztzg9f8w
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+UQrwQM0G9ARh+pyocqmxvssYsCK3Ikys=
X-HE-Tag: 1767626562-817921
X-HE-Meta: U2FsdGVkX19Q/Yq5S3MXBXv8lKQ9rl88RXQsRSgtqRMKia/v1Z/DS6glFd6+f8KtRsRu/8saNzf1fFBN8LHXlkltp8Y5filmlt7bw0I2++/siotNlZBLluXFcGXjc3YKEMgMcdgDN4pe5AR2GwOhMt9Gb1hxGD87vexE94Y5PGS1/0eeQOCKtJVyAotsNBwxJEg8pR+0vqAEVj8aZnkIoJd+eG4Cp4QqhmPYUyKRu2Pu5Wjl/NaWQZAfHmJqQeNUu/QdZBUSpmdif0VkNt38Kinboh+o0iVRYDyWPE8txkMa8P+OqJykA/0qAdknOWMpnSlzLeY4MMHM0boqF5ezzxFpQaeoTj/18MCqoYUHSF4cMAATnG6ZQsZb+PyinUeF

On Mon, 5 Jan 2026 18:15:56 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> We could just ignore this...  The explanation is on the list if people
> have questions.
> 
> The problem is that this is only called from assembly which smatch
> doesn't understand.

I also think this can cause people looking at this code to get confused by
the check. At least a comment should be added.

-- Steve
