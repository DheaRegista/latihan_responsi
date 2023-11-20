import 'package:flutter/material.dart';
import 'api_datasource.dart';
import 'detail_report.dart';
import 'report_model.dart';

class PageListReports extends StatefulWidget {
  const PageListReports({super.key});

  @override
  State<PageListReports> createState() => _PageListReportsState();
}

class _PageListReportsState extends State<PageListReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPORTS LIST"),
      ),
      body: _buildListReportsBody(),
    );
  }

  Widget _buildListReportsBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadReports(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Reports reports = Reports.fromJson(snapshot.data);
              return _buildSuccessSection(reports);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(Reports data) {
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemReports(data.results![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemReports(Results Reports) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageDetailReports(report: Reports),
        ),
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(Reports.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Reports.title!)
              ],
            )
          ],
        ),
      ),
    );
  }
}