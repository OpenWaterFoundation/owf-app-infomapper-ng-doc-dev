# InfoMapper / Appendix - Graphing Properties / Graphing Properties #

## Introduction ##

The following tables list the properties that are currently supported or envisioned
to be enabled in the future. The supported properties have been added to the Common
package code and are being used and converted to work with the Plotly graphing library.
Making changes to them in the TS Product File (what's commonly referred to as a graph
template file) 

## Time Series Product File - Product Properties ##

|**Product Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**|
| ---- | ---- | ---- |
|`CurrentDateTime`|The current date and time to be drawn as a vertical line on all graphs. If the property is not specified, no current date/time line will be drawn. If specified as Auto, the current system time will be used for the date/time. If specified as a valid date/time string (e.g., `2002-02-05 15`), the string will be parsed to obtain the date/time. This property is often specified internally by the application at run time. **Not currently implemented.**|Not drawn.|
|`CurrentDateTimeColor`|Color to use to draw the current date and time. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|Green|
|`Enabled`|Indicates whether the product should be processed. Specify as `True` or `False`. **Not currently implemented.**|`True`|
|`LayoutNumberOfColumns`|The number of columns in the product. **Not currently implemented.**|Currently always `1`.|
|`LayoutNumberOfRows`|The number of rows in the product. **Not currently implemented.**|Currently equal to the number of graphs.|
|`LayoutType`|Indicates how the graphs in a product are laid out. Only `Grid` is supported. **Not currently implemented.**|`Grid`|
|`MainTitleFontName`|Name of font to use for main title (`Arial`, `Courier`, `Helvetica`, `TimesRoman`).|`Arial`|
|`MainTitleFontSize`|Size, in points, for main title.|`20`|
|`MainTitleFontStyle`|Font style (`Bold`, `BoldItalic`, `Plain`, `PlainItalic`).|`Plain`|
|`MainTitleString`|Main title for the product, centered at the top of the page.|No main title.|
|`OutputFile`|Output file when graph product is generated in batch mode. This property is often set at run time by the application. This property is ignored for `ProductType=Report` and must be specified at a subproduct level. **Not currently implemented.**|`C:\TEMP\tmp.png` on windows, `/tmp/tmp.png` on Linux.|
|`Owner`|An identifier that indicates the owner of the TSProduct, used internally when saving TSProduct definitions to a database that implements permissions. **Not currently implemented.**|None – can be blank if permissions are not important.|
|`PeriodEnd`|Ending date for time series data in the product. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time by the application. See `VisibleStart`. **Not currently implemented.**|Full period is read.|
|`PeriodStart`|Starting date for time series data in the product. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time by the application. See `VisibleEnd`. **Not currently implemented.**|Full period is read.|
|`PreviewOutput`|Indicates whether the product should be visually previewed before output. This property is often set at run time by the application and is used to override generation of the `OutputFile`. **Not currently implemented.**|`False`|
|`ProductType`|Time series product type, one of:<br><ul><li>`Graph` – graph (see graph subproduct properties).</li><li>`Report` – report (see report subproduct properties).</li></ul> **Not currently implemented.**|`Graph`|
|`ShowDrawingAreaOutline`|Indicate whether drawing area outlines should be shown. Drawing areas are the logical areas on a graph where content is drawn. This property is useful for development and troubleshooting. **Not currently implemented.**|`False`|
|`SubTitleFontName`|Name of font to use for subtitle (see MainTitleFontName for font list). **Not currently implemented.**|`Arial`|
|`SubTitleFontSize`|Size, in points, for subtitle. **Not currently implemented.**|`10`|
|`SubTitleFontStyle`|Font style (see `MainTitleFontStyle` for style list). **Not currently implemented.**|`Plain`|
|`SubTitleString`|Subtitle for the product.|No subtitle.|
|`TemplateProcessCommandFile`|This property is used by TSTool when processing time series results further before displaying in graphs. See the [Time Series Graph Templates](https://opencdss.state.co.us/tstool/latest/doc-user/appendix-tsview/tsview/#time-series-graph-templates) section of this appendix for more information. **Not currently implemented.**|No time series preprocessing will occur.|
|`TotalHeight`|Height of the total drawing space, which may include multiple graphs, pixels. **Not currently implemented.**|`400`|
|`TotalWidth`|Width of the total drawing space, which may include multiple graphs, pixels. **Not currently implemented.**|`400`|
|`TrackerType`|Indicate the type of tracker to use for the display window:<br><ul><li>`Nearest` – highlight the data point nearest the mouse</li><li>`NearestSelected` – highlight the data point nearest the mouse, considering only selected time series (selected from legend)</li><li>`NearestTime` – highlight the data point(s) on each time series, considering only time proximity</li><li>`NearestTimeSelected` – highlight the data point(s) on each time series, considering only time proximity and selected time series</li><li>`None` – do not display the mouse tracker</li></ul> **Not currently implemented.**|`None`|
|`VisibleStart`|The product visualization will be limited to the specified start date/time (`YYYY-MM-DD HH:mm` to appropriate precision). **Not currently implemented.**|Full period is visualized.|
|`VisibleEnd`|The product visualization will be limited to the specified date/time (`YYYY-MM-DD HH:mm` to appropriate precision). **Not currently implemented.**|Full period is visualized.|

The subproduct properties are associated with the graphs on a page or report files.
There can be one or more graphs on a page, each with different properties.
It is envisioned that graphs can be grouped into several zoom groups,
where zooming in on one graph will cause all graphs to scale similarly.
However, at this time, all graphs in a product are placed in a single zoom group.
It is also envisioned that graphs could be placed anywhere on the page;
however, at this time, multiple graphs on a page can only be stacked vertically, each using the full width of the page.

### Time Series Product File - Graph Properties ###

The following tables describe the subproduct (graph) properties.

**<p style="text-align: center;">
Subproduct (Graph) Properties
</p>**

|**Subproduct (Graph) Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**|
|--|--|--|
|`BarOverlap`|For use with bar graphs (left axis). This property controls how bars are positioned relative to each other, one of:<br><ul><li>`False` – bars will not overlap and will be side by side with space between.</li><li>`True` – bars will overlap. Time series should be specified so that time series with the largest values are drawn first.</li></ul> **Not currently implemented.**|`False`|
|`BarPosition`|For use with bar graphs (left axis). This property controls how bars are positioned relative to the date and can have the values `CenteredOnDate`, `LeftOfDate`, or `RightOfDate`. **Not currently implemented.**|`CenteredOnDate`|
|`BottomXAxisLabelFontName`|Name of font for bottom x-axis labels (see Product `MainLabelFontName`). **Not currently implemented.**|`Arial`|
|`BottomXAxisLabelFontSize`|Bottom x-axis labels font size, points. **Not currently implemented.**|`10`|
|`BottomXAxisLabelFontStyle`|Bottom x-axis labels font style (see Product `MainLabelFontStyle`). **Not currently implemented.**|`Plain`|
|`BottomXAxisTitleFontName`|Name of font for bottom x-axis title (see Product `MainTitleFontName`). **Not currently implemented.**|`Helvetica`|
|`BottomXAxisTitleFontSize`|Bottom x-axis title font size, points. **Not currently implemented.**|`12`|
|`BottomXAxisTitleFontStyle`|Bottom x-axis title font style (see Product `MainTitleFontStyle`). **Not currently implemented.**|`Plain`|
|`BottomXAxisLabelFormat`|Format for X-axis labels. Currently this is confined to date/time axes and only `MM-DD` is recognized. **Not currently implemented.**|Determined automatically.|
|`BottomXAxisMajorGridColor`|Color to use for the major grid. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|Most graph types automatically set to `None`.|
|`BottomXAxisMinorGridColor`|Color to use for the minor grid. This property is not implemented. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|`None`|
|`BottomXAxisTitleString`|Bottom X-axis title string. **Not currently implemented.**|As appropriate for the graph type (often `None` if dates).|
|`DataLabelFontName`|Name of font for data labels (see Product `MainLabelFontName`). **Not currently implemented.**|`Arial`|
|`DataLabelFontSize`|Data label font size, points. **Not currently implemented.**|`10`|
|`DataLabelFontStyle`|Data label font style (see Product `MainLabelFontStyle`). **Not currently implemented.**|`Plain`|
|`DataLabelFormat`|Format specifiers to use for labeling data points. If blank, no labels will be drawn. If specified, labels are drawn for line graphs and XY scatter plots. The following format specifiers are available (all other text in the format is treated literally). The last three specifiers are related to time series data and all others are related to the date for a point. The %v specifier can be specified twice for XY Scatter plots to display the X and Y values. If specified and the time series data property is not specified, the graph property will be used.<br><ul><li>`%%` - Literal percent.</li><li>`%a` - Weekday name abbreviation.</li><li>`%A` - Weekday name.</li><li>`%B` - Month name.</li><li>`%b` - Month name abbreviation.</li><li>`%d` - Day number.</li><li>`%H` - Hour (0-23), 2-digit.</li><li>`%I` - Hour (1-12), 2-digit.</li><li>`%J` - Day of year.</li><li>`%m` - Month 2-digit.</li><li>`%M` - Minute, 2-digit.</li><li>`%p` - AM, PM.</li><li>`%S` - Second, 2-digit.</li><li>`%y` - Year, 2-digit.</li><li>`%Y` - Year, 4-digit.</li><li>`%Z` - Time zone.</li><li>`%v` - Data value, formatted according to units.</li><li>`%U` - Data units.</li><li>`%q` - Data flag (e.g., character that indicates quality).</li></ul>**Not currently implemented.**|Blank (no data point labels).|
|`DataLabelPosition`|Indicates the position of data labels, relative to the data point: `UpperRight`, `Right`, `LowerRight`, `Below`, `LowerLeft`, `Left`, `UpperLeft`, `Above`, `Center`. If specified and the time series data property is not specified, the graph property will be used. **Not currently implemented.**|`Right`|
|`Enabled`|Indicates whether the sub-product should be processed. Specify as `True` or `False`. **Not currently implemented.**|`True`|
|`GraphHeight`|Graph height in pixels. Currently this property is ignored (use Product `TotalHeight` instead). **Not currently implemented.**|Product `TotalHeight` (minus space for titles, etc.) if one graph, or an even fraction of Product `TotalHeight` (minus space for titles, etc.) if multiple graphs.|
|`GraphType`|Indicates the left y-axis graph type for all data in a graph product (left axis). Available options are: <ul><li>`Area`</li><li>`AreaStacked`</li><li>`Bar` - **Not currently implemented.**</li><li>`Duration` - **Not currently implemented.**</li><li>`Line`</li><li>`PeriodOfRecord` - **Not currently implemented.**</li><li>`Point`</li><li>`Raster` - **Not currently implemented.**</li><li>`XY-Scatter` - **Not currently implemented.**</li></ul>|`Line`|
|`GraphWidth`|Graph width in pixels. Currently this property is ignored (use Product `TotalWidth` instead). **Not currently implemented.**|Product `TotalWidth` (minus space for titles, etc.).|
|`LayoutXPercent`|For the product grid layout, the width of the graph as a total width of the product, percent. **Not currently implemented.**|100 divided by the number of columns in the layout.|
|`LayoutYPercent`|For the product grid layout, the height of the graph as a total width of the product, percent. **Not currently implemented.**|100 divided by the number of rows in the layout.|
|`LeftYAxisIgnoreUnits`|Indicates whether to ignore units for the left Y-axis. Normally, units are checked to make sure that data can be plotted consistently. If this property is set, then the user will not be prompted at run-time to make a decision. Specify as `True` or `False`. **Not currently implemented.**|If not specified, the units will be checked at run-time and, if not compatible, the user will be prompted to indicate whether to ignore units in the graphs. The property will not be reset automatically but will be handled internally using the interactively supplied value.|
|`LeftYAxisDirection`|Use `Normal` to indicate normal direction (minimum y-value at bottom) and `Reverse` to indicate reversed y-axis (maximum value at bottom). **Not currently implemented.**|`Normal`|
|`LeftYAxisLabelFontName`|Name of font for left y-axis labels (see Product `MainLabelFontName`). **Not currently implemented.**|`Arial`|
|`LeftYAxisLabelFontSize`|Left y-axis labels font size, points. **Not currently implemented.**|`10`|
|`LeftYAxisLabelFontStyle`|Left y-axis labels font style (see Product `MainLabelFontStyle`). **Not currently implemented.**|`Plain`|
|`LeftYAxisLabelPrecision`|If numeric data, the number of digits after the decimal point in labels. **Not currently implemented.**|Automatically determined from graph type and/or data units.|
|`LeftYAxisLabel1000Separator`|The character to use for number 1000’s separator:<br><ul><li>`None` – do not use a separator</li><li>`,` – use comma as separator</li><li>`.` – use period as separator</li><li>Space – use a space as separator</li></ul><br>In the future a locale setting may be added. **Not currently implemented.**|`None`|
|`LeftYAxisMajorGridColor`|Color to use for the major grid. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|Most graph types automatically set to `lightgray`.|
|`LeftYAxisMajorTickColor`|Color to use for the major ticks. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|Typically `None` because grid is used instead.|
|`LeftYAxisMax`|Maximum value for the left Y-Axis. **Not currently implemented.**|`Auto`, automatically determined. If the actual data exceed the value, the property will be ignored.|
|`LeftYAxisMin`|Minimum value for the left Y-Axis. **Not currently implemented.**|`Auto`, automatically determined. If the actual data exceed the value, the property will be ignored.|
|`LeftYAxisMinorGridColor`|Color to use for the minor grid. This property is not implemented. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|`None`|
|`LeftYAxisTitleFontName`|Name of font for left y-axis title (see Product `MainTitleFontName`). **Not currently implemented.**|`Arial`|
|`LeftYAxisTitleFontSize`|Left y-axis title font size, points. **Not currently implemented.**|`12`|
|`LeftYAxisTitleFontStyle`|Left y-axis title font style (see Product `MainTitleFontStyle`). **Not currently implemented.**|`Plain`|
|`LeftYAxisTitlePosition`|Position of the left y-axis title: `AboveAxis`, or `LeftOfAxis`. **Not currently implemented.**|`AboveAxis`|
|`LeftYAxisTitleRotation`|Clockwise rotation from horizontal for y-axis title. Typical values are `0` for horizontal and `270` for vertical. **Not currently implemented.**|`0`|
|`LeftYAxisTitleString`|Left y-axis title string.|As appropriate for the graph type (often the data units).|
|`LeftYAxisType`|Left y-axis type (`Log`, or `Linear`). **Not currently implemented.**|`Linear`|
|`LeftYAxisUnits`|Left y-axis units. See also `LeftYAxisIgnoreUnits`. **Not currently implemented.**|Units from first valid time series, or as appropriate for the graph type.|
|`LegendFontName`|Name of font for legend (see Product `MainTitleFontName`). **Not currently implemented.**|`Arial`|
|`LegendFontSize`|Legend font size, points. **Not currently implemented.**|`10`|
|`LegendFormat`|The legend format is composed of literal characters and/or time series data format specifiers, as follows.|`Auto`, which uses `Description`, `Identifier`, `Units`, `Period`|No legend will be displayed.<br><ul><li>`${ts:Property}` - The specified time series property will be inserted as a string.</li><li>`%%` - Literal percent.</li><li>`%A` - Time series alias.</li><li>`%D` - Description (e.g., `RED RIVER BELOW MY TOWN`).</li><li>`%F` - Full time series identifier (e.g., `XX_FREE.USGS.QME.24HOUR.Trace1`).</li><li>`%I` - Full interval part of the identifier (e.g., `24Hour`).</li><li>`%b` - Base part of the interval (e.g., `Hour`).</li><li>`%m` - Multiplier part of the interval (e.g., `24`).</li><li>`%L` - Full location part of the identifier (e.g., `XX_FREE`).</li><li>`%l` - Main part of the location (e.g., `XX`).</li><li>`%w` - Sub-location (e.g., `FREE`).</li><li>`%S` - The full source part of the identifier (e.g., `USGS`).</li><li>`%s` - Main data source (e.g., `USGS`).</li><li>`%x` - Sub-source (reserved for future use).</li><li>`%T` - Full data type (e.g., `QME`).</li><li>`%t` - Main data type.</li><li>`%k` - Sub-data type.</li><li>`%U` - Data units (e.g., `CFS`).</li><li>`%z` - Sequence number (used with traces).</li><li>`%Z` - Scenario part of identifier (e.g., `Trace1`).|Blank|
|`LegendPosition`|Position of the legend relative to the graph: <ul><li>`Bottom`</li><li>`BottomLeft`</li><li>`BottomRight`</li><li>`InsideLowerLeft`</li><li>`InsideLowerRight`</li><li>`InsideUpperLeft`</li><li>`InsideUpperRight`</li><li>`Left`</li><li>`None`</li><li>`Right`</li><li>`UpperLeft`</li><li>`UpperRight`</li></ul>|`Bottom`|
|`MainTitleFontName`|Name of font to use for graph main title (see Product `MainTitleFontName`). |`Arial`|
|`MainTitleFontSize`|Size, in points, for graph main title. |`10`|
|`MainTitleFontStyle`|Graph main title font style (see Product `MainTitleFontStyle`).|`Plain`|
|`MainTitleString`|Main title for the graph.|`None`, or appropriate for graph type.|
|`PeriodEnd`|Ending date for time series data in the sub-product. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time. **Not currently implemented.**|Full period is read.|
|`PeriodStart`|Starting date for time series data in the sub-product. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time. **Not currently implemented.**|Full period is read.|
|`RightYAxisBarOverlap`|For use with bar graphs (right axis). This property controls how bars are positioned relative to each other, one of:<br><ul><li>`False` – bars will not overlap and will be side by side with space between.</li><li>`True` – bars will overlap. Time series should be specified so that time series with the largest values are drawn first.</li></ul>**Not currently implemented.**|`False`|
|`RightYAxisBarPosition`|For use with bar graphs (right axis). This property controls how bars are positioned relative to the date and can have the values `CenteredOnDate`, `LeftOfDate`, or `RightOfDate`. **Not currently implemented.**|`CenteredOnDate`|
|`RightYAxisDirection`|Use `Normal` to indicate normal direction (minimum y-value at bottom) and `Reverse` to indicate reversed y-axis (maximum value at bottom). **Not currently implemented.**|`Normal`|
|`RightYAxisGraphType`|Graph type for right y-axis, used for drawing time series unless the time series `GraphType` property specifies a different graph type. Allowed values are: <ul><li>`Area` - **Not currently implemented.**</li><li>`Bar` - **Not currently implemented.**</li><li>`Line` - **Not currently implemented.**</li><li>`Point` - **Not currently implemented.**</li></ul>|`Line`|
|`RightYAxisIgnoreUnits`|Indicates whether to ignore units for the right Y-axis. Normally, units are checked to make sure that data can be plotted consistently. If this property is set, then the user will not be prompted at run-time to make a decision. Specify as `True` or `False`. **Not currently implemented.**|If not specified, the units will be checked at run-time and, if not compatible, the user will be prompted to indicate whether to ignore units in the graphs. The property will not be reset automatically but will be handled internally using the interactively supplied value.|
|`RightYAxisLabelFontName`|Name of font for right y-axis labels (see Product `MainLabelFontName`). **Not currently implemented.**|`Arial`|
|`RightYAxisLabelFontSize`|Right y-axis labels font size, points. **Not currently implemented.**|`10`|
|`RightYAxisLabelFontStyle`|Right y-axis labels font style (see Product `MainLabelFontStyle`). **Not currently implemented.**|`Plain`|
|`RightYAxisTitlePosition`|Position of the right y-axis title: `AboveAxis`, `None`, or `RightOfAxis`. **Not currently implemented.**|`None`|
|`RightYAxisTitleRotation`|Clockwise rotation from horizontal for y-axis title. Typical values are `0` for horizontal and `90` for vertical. **Not currently implemented.**|`0`|
|`RightYAxisMajorGridColor`|Color to use for the major grid. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.**|`None`|
|`RightYAxisMajorTickColor`|Color to use for the major ticks. See the [Color Specification](#time-series-product-file-color-specification) section. **Not currently implemented.**|`None`|
|`RightYAxisMax`|Maximum value for the right Y-Axis. **Not currently implemented.**|`Auto`, automatically determined. If the actual data exceed the value, the property will be ignored.|
|`RightYAxisMin`|Minimum value for the right Y-Axis. **Not currently implemented.**|`Auto`, automatically determined. If the actual data exceed the value, the property will be ignored.|
|`RightYAxisTitleFontName`|Name of font for right y-axis title (see Product `MainTitleFontName`). **Not currently implemented.**|`Arial`|
|`RightYAxisTitleFontSize`|Right y-axis title font size, points. **Not currently implemented.**|`12`|
|`RightYAxisTitleFontStyle`|Right y-axis title font style (see Product `MainTitleFontStyle`). **Not currently implemented.**|`Plain`|
|`RightYAxisTitleString`|Right y-axis title string. **Not currently implemented.**||
|`RighttYAxisType`|Right y-axis type (`Log`, or `Linear`). **Not currently implemented.**|`Linear`|
|`RightYAxisUnits`|Right y-axis units. See also `RightYAxisIgnoreUnits`. **Not currently implemented.**|Units from first valid time series, or as appropriate for the graph type.|
|`SelectedTimeSeriesLineWidth`|If a time series has been selected by clicking on the legend, then this property is used to adjust the original `LineWidth` property to highlight the time series:<br><ul><li>`N` – line width, pixels `N`</li><li>`xN` – multiply the original line width by `N`</li><li>`+N` – add `N` pixels to the original width`x2`</li></ul>**Not currently implemented.**||
|`SubTitleFontName`|Name of font to use for graph Sub title (see Product `MainTitleFontName`). **Not currently implemented.**|`Arial`|
|`SubTitleFontSize`|Size, in points, for graph sub title. **Not currently implemented.**|`10`|
|`SubTitleFontStyle`|Graph sub title font style (see Product `MainTitleFontStyle`). **Not currently implemented.**|`Plain`|
|`SubTitleString`|Sub title for the graph.|No subtitle.|
|`TopXAxisLabelFontName`|Name of font for Top x-axis labels (see Product `MainLabelFontName`). This property is not enabled. **Not currently implemented.**|`Arial`|
|`TopXAxisLabelFontSize`|Top x-axis labels font size, points. This property is not enabled. **Not currently implemented.**|`10`|
|`TopXAxisLabelFontStyle`|Top x-axis labels font style (see Product `MainLabelFontStyle`). This property is not enabled. **Not currently implemented.**|`Plain`|
|`TopXAxisTitleFontName`|Name of font for Top x-axis title (see Product `MainTitleFontName`). This property is not enabled. **Not currently implemented.**|`Arial`|
|`TopXAxisTitleFontSize`|Top x-axis title font size, points. This property is not enabled. **Not currently implemented.**|`12`|
|`TopXAxisTitleFontStyle`|Top x-axis title font style (see Product `MainTitleFontStyle`). This property is not enabled. **Not currently implemented.**|`Plain`|
|`TopXAxisTitleString`|Top X axis title string. This property is not enabled. **Not currently implemented.**|As appropriate for the graph type.|
|`XYScatterAnalyzeForFilling`|Indicate whether the analysis should be used to analyze for filling. If true, then the `XYScatterIntercept`, `XYScatterFillPeriodStart`, and `XYScatterFillPeriodEnd` properties may be specified. **Not currently implemented.**|`False`|
|`XYScatterDependentAnalysisPeriodEnd`|Specify the ending date/time for the period to analyze the dependent time series data, to determine the best-fit line. **Not currently implemented.**|Blank (analyze full period).|
|`XYScatterDependentAnalysisPeriodStart`|Specify the starting date/time for the period to analyze the dependent time series data, to determine the best-fit line. **Not currently implemented.**|Blank (analyze full period).|
|`XYScatterFillPeriodEnd`|When `XYScatterAnalyzeForFilling=true`, indicates the ending date/time of the period to fill, using standard date/time string. **Not currently implemented.**|Blank (fill full period).|
|`XYScatterFillPeriodStart`|When `XYScatterAnalyzeForFilling=true`, indicates the starting date/time of the period to fill, using standard date/time string. **Not currently implemented.**|Blank (fill full period).|
|`XYScatterIndependentAnalysisPeriodEnd`|Specify the ending date/time for the period to analyze the independent time series data, to determine the best-fit line. **Not currently implemented.**|Blank (analyze full period).|
|`XYScatterIndependentAnalysisPeriodStart`|Specify the starting date/time for the period to analyze the independent time series data, to determine the best-fit line. **Not currently implemented.**|Blank (analyze full period).|
|`XYScatterIntercept`|The value of `A` in the best-fit equation `A + bX`. If specified, the value of B is adjusted accordingly. This property cannot be used with transformed data and if specified must be `0`. **Not currently implemented.**|Blank (do not force the intercept).|
|`XYScatterMethod`|Curve fit method used when analyzing data for the XY Scatter graph (`OLSRegression` or `MOVE2`). **Not currently implemented.**|`OLSRegression`|
|`XYScatterMonth`|One or more month numbers used when analyzing data for the XY Scatter graph, separated by commas or spaces (`1`=Jan). **Not currently implemented.**|Blank (analyze all)|
|`XYScatterNumberOfEquations`|Number of equations used when analyzing data for the XY Scatter graph (`OneEquation` or `MonthlyEquations`). **Not currently implemented.**|`OneEquation`|
|`XYScatterTransformation`|Data transformation used when analyzing data for the XY Scatter graph (`None` or `Log`). This property is not enabled. **Not currently implemented.**|`None`|
|`ZoomEnabled`|Indicates whether the graph can be zoomed (`true`) or not (`false).|Graph types are evaluated and the property is automatically set. XY-Scatter and Duration graphs can't zoom. **Not currently implemented.**|
|`ZoomGroup`|Indicate a group identifier that is used to associate graphs for zooming purposes. For example, there may be more than one distinct group of graphs, each with its own overall period or data limits. The graph types may also be incompatible for zooming. This is an experimental feature and should currently not be specified in product files. **Not currently implemented.**|All graphs are assigned to zoom group 1.|

### Time Series Product File - Report Properties ###

The following table describes the subproduct (report) properties.
Limited support for report products are currently enabled.
Reports are defined as any format other than graphical output,
including raw data formats like delimited and [DateValue files](https://opencdss.state.co.us/tstool/latest/doc-user/datastore-ref/DateValue/DateValue/).
The number of properties for reports will continue to be expanded as additional features are enabled.
An example of a report product file is as follows (in this case for NWSRFS FS5Files input type time series):

```text
[Product]

ProductType = Report
Enabled = true

[SubProduct 1]

OutputFile = C:\Report_6_Hour
ReportType = DateValue

[Data 1.1]
TSID = FZRDR.NWSRFS.SPEL.6HOUR~NWSRFS_FS5Files

[SubProduct 2]

OutputFile = C:\Report_24_Hour
ReportType = DateValue

[Data 2.1]
TSID = FZRDR.NWSRFS.PELV.24HOUR~NWSRFS_FS5Files
```

**<p style="text-align: center;">
Subproduct (Report) Properties
</p>**

|**Subproduct (Report) Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--|--|--|
|`OutputFile`|Output file when report product is generated in batch mode. If a relative path is given, the file will be written relative to the working directory for the software. This property is often set at run time by the application. **Not currently implemented.**|`C:\TEMP\tmp_report_N` on windows, `/tmp/tmp_report_N` on UNIX|
|`Enabled`|Indicates whether the sub-product should be processed. Specify as `true` or `false`. **Not currently implemented.**|`true`|

### Time Series Product File - Time Series Properties ###

Each subproduct (graph) includes time series data, and the presentation of each time
series can be configured using data (time series) properties.
In some cases, properties are layered, allowing a property to be defined for the
subproduct (graph) for use by all time series (e.g., legend text).

The following tables list data (time series) properties.

**<p style="text-align: center;">
Data (Time Series) Properties
</p>**

|**Data (Time Series) Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--|--|--|
|`Color`|Color to use when drawing the data. See the [Color Specification](#time-series-product-file---color-specification) section.|Repeating, using common colors.|
|`DataLabelFormat`|Data label format specifiers. See the graph DataLabelFormat property. If the graph property is specified and the time series property is not, the graph property will be used. **Not currently implemented.**|Blank (no labels).|
|`DataLabelPosition`|Data label position. See the graph `DataLabelPosition` property. If the graph property is specified and the time series property is not, the graph property will be used. **Not currently implemented.**|`Right`|
|`Enabled`|Indicates whether the data should be processed. Specify as `true` or `false`. **Not currently implemented.**|`true`|
|`FlaggedDataSymbolStyle`|Symbol style for data points that have non-empty data flag string. See the `SymbolStyle` property for possible values. **Not currently implemented.**|Same as `SymbolStyle`|
|`FlaggedDataSymbolTable`|It is envisioned that this property will be enabled in the future to allow fine-grained control of symbols when data flags are used. **Not currently implemented.**|Property not enabled.|
|`GraphType`|Indicates the graph type for the data in a graph product. Available options are: <ul><li>`Area`</li><li>`AreaStacked`</li><li>`Bar` - **Not currently implemented.**</li><li>`Duration` - **Not currently implemented.**</li><li>`Line`</li><li>`PeriodOfRecord` - **Not currently implemented.**</li><li>`Point`</li><li>`XY-Scatter` - **Not currently implemented.**</li></ul> This functionality is being phased in, with initial development focusing on allowing lines to be drawn on area graphs.|Property enabled only for area graphs.|
|`LegendFormat`|The legend for the data can be specified and will override the SubProduct `LegendFormat` property (see that property for details). The time series property `tsp:LegendFormat` will be used if found.|`Auto`|
|`LineStyle`|Line style. Currently only `None` (e.g., for symbols only) and `Solid` are allowed. **Not currently implemented.**|`Solid`|
|`LineWidth`|Line width, pixels.|`1`|
|`PeriodEnd`|Ending date for time series data in the data item. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time. **Not currently implemented.**|Full period is read.|
|`PeriodStart`|Starting date for time series data in the data item. The date should be formatted according to common conventions (e.g., `YYYY-MM-DD HH:mm`), and should ideally be of appropriate precision for the data being queried. This property is often set at run time. **Not currently implemented.**|Full period is read.|
|`RasterGraphLegendPosition` | The position of raster graph legend. See values for the `LegendPosition` property. Currently only `Right` is supported. The normal legend showing the time series can be displayed in addition to the raster graph legend. **Not currently implemented.** | `Right` |
|`RegressionLineEnabled`|Indicates whether the regression line should be shown (currently only used with the XY-Scatter graph type). The line is drawn in black (there is currently not a property to set the line color). **Not currently implemented.**|`true`|
|`SymbolSize`|Symbol size in pixels. **Not currently implemented.**|`0` (no symbol)|
|`SymbolStyle`|Symbol style. Recognized styles are:<br><ul><li>`None`</li><li>`Arrow-Down`</li><li>`Arrow-Left`</li><li>`Arrow-Right`</li><li>`Arrow-Up`</li><li>`Asterisk`</li><li>`Circle-Hollow`</li><li>`Circle-Filled`</li><li>`Diamond-Hollow`</li><li>`Diamond-Filled`</li><li>`Plus`</li><li>`Plus-Square`</li><li>`Square-Hollow`</li><li>`Square-Filled`</li><li>`Triangle-Down-Hollow`</li><li>`Triangle-Down-Filled`</li><li>`Triangle-Left-Hollow`</li><li>`Triangle-Left-Filled`</li><li>`Triangle-Right-Hollow`</li><li>`Triangle-Right-Filled`</li><li>`Triangle-Up-Hollow`</li><li>`Triangle-Up-Filled`</li><li>`X, X-Cap`</li><li>`X-Diamond`</li><li>`X-Edge`</li><li>`X-Square`</li></ul> **Not currently implemented.**|`None`|
|`SymbolTablePath`| Path to a file containing symbol table, used with a raster graph. If a relative path is specified, it is relative to the time series product file. **Not currently implemented.** | Default symbol table is used. |
|`TSAlias`|Time series alias to match, will override `TSID`.|Specify `TSAlias` or `TSID`.|
|`TSID`|Time series identifier to match, will be overrules by `TSAlias`.|Specify `TSAlias` or `TSID`.|
|`XAxis`|X-axis to use (Bottom or Top). This currently always defaults to bottom. **Not currently implemented.**|`Bottom`|
|`XYScatterConfidenceInterval`|This property is only used with XY scatter plots. If not blank, the value indicates that confidence level lines should be drawn on the XY Scatter plot for the given confidence interval, percent. Currently only 99 and 95 percent confidence intervals are supported. The lines will only be drawn if the curve fit line is drawn (see `RegressionLineEnabled`). **Not currently implemented.**|Blank (do not draw).|
|`YAxis`|Y-axis to use (`Left` or `Right`). **Not currently implemented.**|`Left`|

### Time Series Product File - Annotation Properties ###

Annotations are associated with subproducts (graphs) and are implemented as simple shapes that are drawn on normal graphs.
It is envisioned that all shapes supported by the drawing package will eventually
be supported but currently only text labels and lines can be specified as annotations.

To allow flexibility, annotations can be placed using two coordinate systems.
For example, if a product is generated using real-time data, the date/time axis will have a different range over time.
Therefore, placing an annotation using a fixed coordinate would cause the annotation to scroll off the graph as time passes.
To resolve this issue and still allow absolute positioning of annotations, as appropriate,
the following coordinate systems are supported, as specified by the `XAxisSystem` and `YAxisSystem` properties:

* ***Data*** - When using the data coordinate system,
it is expected that the coordinates used to define the annotation will agree with the data units being drawn.
For example, for a normal time series graph, the x-axis coordinate would be specified as a
date/time to the necessary precision and the y-axis coordinate would be specified using data values.

It is envisioned that a notation `+NNN` and `–NNN` will be implemented in the future to allow offsets from the edges of the graph, in data units.

* ***Percent*** - When using the percent coordinate system,
it is expected that the coordinates used to define the annotation are specified
as a percent of the graph width or height, with `0` being the lower/left and `100` being the upper/right.

Each axis can have a different coordinate system (e.g., the y-axis value can be set
using data units and the x-axis value can be set using percent).

The following tables list annotation properties.

**<p style="text-align: center;">
Annotation Properties (All Shape Types)
</p>**

|**Annotation Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--|--|--|
|`AnnotationID`|A string that identifies the annotation, to be used in software displays. If there are many annotations, this helps identify them when editing. **Not currently implemented.**|Annotation + annotation number (1+) (e.g., `Annotation1`).|
|`AnnotationName`|May be implemented in future since shown in the property editor. **Not currently implemented.**||
|`AnnotationTableID`|The table identifier that annotation data should be taken from. Annotation tables allow many annotations to be provided in a table using shared configuration properties. If specified, the corresponding table must have been passed in from the software application. The `Point` and `Points` property for the annotation can be specified using the form `${tablecolumnvalue:ColumnName}`, which will cause a look-up of the points in the table column. Any table annotations that fall within the viewable graph will be drawn. **Not currently implemented.**|If not specified then normal annotation properties are used for annotation data.|
|`Color`|Color to use when drawing the annotation. See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.** |`Black`|
|`Order`|The drawing order for the annotation:<br><ul><li>`BehindAxes` to draw behind axes.</li><li>`BehindData` to draw behind time series data.</li><li>`OnTopOfData` to draw on top of time series data.</li></ul> **Not currently implemented.**|`OnTopOfData`|
|`ShapeType`|The type of shape to be drawn for the annotation. Currently accepted values are Line, `Rectangle`, `Symbol`, and `Text`. See the following tables for properties for each annotation shape type. **Not currently implemented.**|None – must be specified.|
|`XAxisSystem`|Indicates the system for X coordinates:<br><ul><li>If `Data`, the X coordinates that are specified will be in data units. If the x-axis is date/time, specify the value as `YYYY-MM-DD` or as appropriate for precision of date/time (future feature).</li><li>If `Percent`, the X coordinates are percent of the graph (0% is left and 100% is right). **Not currently implemented.**|`Data`|
|`YAxis`|Indicate which axis the annotation is associated with, either Left or Right. **Not currently implemented.**|`Left`|
|`YAxisSystem`|Indicates the system for Y coordinates:<br><ul><li>If `Data`, the Y coordinates that are specified will be in data units.</li><li>If `Percent`, the Y coordinates are percent of the graph (0% is bottom and 100% is top). **Not currently implemented.**|`Data`|

**<p style="text-align: center;">
Annotation Properties (ShapeType=Line)
</p>**

|**Annotation Property**|**Description**|**Default**|
|--|--|--|
|`LineStyle`|Line style. Currently only `None` and `Solid` are allowed. **Not currently implemented.**|`Solid`|
|`LineWidth`|Line width, pixels. **Not currently implemented.**|`1`|
|`Points`|X and Y coordinates for the line endpoints, as follows: `X1,Y1,X2,Y2`. **Not currently implemented.**|`None` – must be specified.|

**<p style="text-align: center;">
Annotation Properties (ShapeType=Rectangle)
</p>**

|**Annotation Property**|**Description**|**Default**|
|--|--|--|
|`FillPattern`|Envisioned for future. Pattern to use other than default solid fill. **Not currently implemented.**||
|`OutlineColor`|Envisioned for future. The `Color` property is used for fill color.See the [Color Specification](#time-series-product-file---color-specification) section. **Not currently implemented.** ||
|`Points`|X and Y coordinates for the rectangle corners, as follows: `X1,Y1,X2,Y2`. **Not currently implemented.**|None – must be specified.|
|`Transparency`|Envisioned for future. **Not currently implemented.**||

**<p style="text-align: center;">
Annotation Properties (ShapeType=Symbol)
</p>**

|**Annotation Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**|
|--|--|--|
|`Point`|X and Y coordinates for the symbol position, as follows: `X1,Y1` **Not currently implemented.**|None – must be specified.|
|`SymbolPosition`|Indicates the position of symbol, relative to the point: `UpperRight`, `Right`, `LowerRight`, `Below`, `LowerLeft`, `Left`, `UpperLeft`, `Above`, `Center`. **Not currently implemented.**|`Center`|
|`SymbolSize`|Size of symbol in pixels. **Not currently implemented.**|`0`|
|`SymbolStyle`|Symbol style from provided choices. **Not currently implemented.**|`None`|

**<p style="text-align: center;">
Annotation Properties (ShapeType=Text)
</p>**

|**Annotation Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**|
|--|--|--|
|`FontSize`|Annotation text font size, points. **Not currently implemented.**|`10`|
|`FontStyle`|Annotation text font style (see Product `MainLabelFontStyle`). **Not currently implemented.**|`Plain`|
|`FontName`|Annotation font name (see Product `MainTitleFontName`). **Not currently implemented.**|`Arial`|
|`Point`|X and Y coordinates for the text position, as follows: `X1,Y1` **Not currently implemented.**|None – must be specified.|
|`Text`|The string to display. **Not currently implemented.**|Blank|
|`TextPosition`|Indicates the position of text, relative to the point: `UpperRight`, `Right`, `LowerRight`, `Below`, `LowerLeft`, `Left`, `UpperLeft`, `Above`, `Center`. **Not currently implemented.**|`Right`|

### Time Series Product File - Color Specification ###

Colors are specified for a number of different properties,
including the feature color and outline color.
In order to allow flexibility in specifying colors, a number of formats are supported:

* Named color. Available colors are: `None` (transparent), `Black`, `Blue`, `Cyan`, `DarkGray`, `Gray`, `Green`, `LightGray`, `Magenta`, `Orange`, `Pink`, `Red`, `White`, `Yellow`.
* Comma-separated Color Triplets as 0-255 (e.g., `255,0,0`) or 0.0-1.0 (e.g., `1.0,0.0,0.0`).
* Hexadecimal: `0xRRGGBB` (e.g., `0xFF0000` for red).
* Hexadecimal: `#RRGGBB` (e.g., `#FF0000` for red).
* All colors accept optional fourth value indicating the opacity (alpha) value.
Opacity is the opposite of transparency and therefore an opacity of `0.0` (`0`) is fully transparent
and `1.0` (`255`) is fully opaque.